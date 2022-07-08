import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

import '../../../../utils/color_manager.dart';

class FeaturedServiceItem extends StatelessWidget {
  final String iconName;
  final String serviceName;
  final OnFeaturedServiceClick onServiceClick;

  FeaturedServiceItem(
      {this.iconName = ImageAssets.icon_horoscope,
      this.serviceName = "Horoscope",
      required this.onServiceClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onServiceClick(serviceName),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            vertical: AppPadding.p12,
          ),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s20),
            border: Border.all(
              color: ColorManager.borderShadow,
              width: 1,
            ),
          ),
          width: MediaQuery.of(context).size.width / 5,
          height: AppSize.s10 * 14,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  iconName,
                  height: AppSize.s28,
                  width: AppSize.s28,
                ),
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  serviceName,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 14,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}

typedef OnFeaturedServiceClick = void Function(String feature);
