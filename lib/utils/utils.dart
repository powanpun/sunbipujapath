import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/toast.dart';
import 'package:puja_path/utils/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void launchURL(String url) async {
    try {
      var bool = !await launch(url);
    } catch (e) {
      errorToast('Could not open $url');
    }
  }

  static void launchInMap(String lattitude, String longitude) async {
    var url =
        "https://maps.google.com/maps/search/?api=1&query=$lattitude,$longitude";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Could not launch");
      throw 'Could not launch Maps';
    }
  }

  static Future<String> getDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String device = "";
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.model;
    }
    return device;
  }

  static String timeAgoSinceDate(String dateString,
      {bool numericDates = true}) {
    DateTime notificationDate;
    try {
      notificationDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateString);
    } catch (e) {
      return dateString;
    }
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);

    if (difference.inDays > 8) {
      return DateFormat("yyyy-MM-dd").format(notificationDate);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  static showDialogWithOptions(
      BuildContext context, String title, Function callBack) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Ok"),
            onPressed: () {
              callBack();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  static showDialogWithoutOptions(
    BuildContext context,
    String title,
  ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        actions: <Widget>[
          TextButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  static Widget getAppBarText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Puja ",
            style: TextStyle(
              color: ColorManager.darkPrimary,
              fontSize: FontSize.s18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: "Path",
            style: TextStyle(
              color: ColorManager.primary,
              fontSize: FontSize.s18.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  static Widget getAppBarTextAndIcon() {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Puja ",
                  style: TextStyle(
                    color: ColorManager.darkPrimary,
                    fontSize: FontSize.s20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: "Path",
                  style: TextStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
        Icon(Icons.search),
        SizedBox(
          width: AppSize.s10.r * 2,
        ),
        Icon(Icons.shopping_cart_outlined)
      ],
    );
  }
}
