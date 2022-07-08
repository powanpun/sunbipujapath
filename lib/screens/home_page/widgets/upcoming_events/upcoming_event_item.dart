import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class UpcomingEventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.w,
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
          vertical: AppPadding.p8,
        ),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s20),
          border: Border.all(
            color: ColorManager.borderShadow,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            _getDateWidget(context),
            SizedBox(
              width: AppSize.s18.w,
            ),
            _getDetailWidget(context),
          ],
        ));
  }

  Widget _getDateWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          "7",
          style: Theme.of(context).textTheme.headline4,
        ),
        Text("Mangsir",
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: ColorManager.primary,
                  fontWeight: FontWeight.w500,
                )),
      ],
    ).addBorder(
      context,
      borderRadius: AppSize.s10,
      padding: EdgeInsets.all(AppPadding.p8),
      color: ColorManager.primaryLight,
      addBorder: false,
    );
  }

  Widget _getDetailWidget(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: AppSize.s4,
          ),
          Text(
            "Mangla Chatruthi Brata",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: AppSize.s4,
          ),
          Text(
            "23 Nov 2021",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
