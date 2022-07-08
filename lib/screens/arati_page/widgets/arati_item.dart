import 'package:flutter/material.dart';
import 'package:puja_path/model/arati_model.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class AratiItem extends StatelessWidget {

  final Data aratiModel;

  AratiItem(this.aratiModel);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          ImageAssets.rudrakhsya,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ).addBorder(
          context,
          borderRadius: AppSize.s10,
          clipBehaviour: Clip.antiAlias,
          addBorder: false,
        ),
        SizedBox(
          width: AppSize.s16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aratiModel.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: AppSize.s8,
              ),
              Text(
                aratiModel.duration,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.play_circle_outline_sharp,
          size: AppSize.s28,
          color: ColorManager.ratingColor,
        )
      ],
    ).addBorder(
      context,
      padding: EdgeInsets.all(
        AppPadding.p10,
      ),
      margin: EdgeInsets.only(
        bottom: AppMargin.m10,
      ),
    );
  }
}
