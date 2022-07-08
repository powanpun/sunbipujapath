import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:puja_path/getx/home_getx_controller.dart';
import 'package:puja_path/screens/dashboard/dashboard.dart';
import 'package:puja_path/screens/login_page/login_page.dart';

import 'arati_controller.dart';
import 'auth_and_user_controller.dart';
import 'horoscope_controller.dart';

class AppGetXController extends GetxController {
  final AuthAndUserController _authAndUserController =
      Get.put(AuthAndUserController());

  onSplashStart(BuildContext context) async {
    var accessToken = await _authAndUserController.getAuthTokenFromPref();
    // getFcmToken();
    Get.put(AratiController());
    Get.put(HomeGetxController());
    Get.put(HoroscopeController());
    if (accessToken.isNotEmpty) {
      _authAndUserController.getUserDetailsFromPref();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Dashboard()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

/*  void getFcmToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String token = await messaging.getToken(
          vapidKey: "BGpdLRs......",
        ) ??
        "";
    _authAndUserController.putFcmToPref(token);
  }*/
}
