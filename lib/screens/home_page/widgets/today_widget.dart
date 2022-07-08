import 'package:flutter/material.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class TodayWidget extends StatelessWidget {
  const TodayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p14,
      ),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s20),
        border: Border.all(
          color: ColorManager.borderShadow,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          /* Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DoctorConsultation()));*/
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  ImageAssets.icon_location,
                  height: AppSize.s16,
                  width: AppSize.s16,
                ),
                SizedBox(
                  width: AppSize.s8,
                ),
                Text(
                  "Kathmandu",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                text: "Today",
                style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightBlack),
                children: [
                  TextSpan(
                    text: "  Mangisr 7",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w500, color: ColorManager.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).addMargin(
        margin: EdgeInsets.fromLTRB(
      AppMargin.m20,
      AppMargin.m16,
      AppMargin.m20,
      AppMargin.m8,
    ));
  }
}
