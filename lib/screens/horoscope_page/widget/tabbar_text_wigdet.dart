import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/values_manager.dart';

class TabBarTextWidget extends StatelessWidget {
  final String text;

  TabBarTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(top: AppPadding.p8.r),
            child: Text(
              text,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: FontSize.s14.sp,
                  fontWeight: FontWeightManager.medium),
            )));
  }
}
