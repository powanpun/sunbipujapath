import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puja_path/getx/arati_controller.dart';
import 'package:puja_path/screens/arati_page/widgets/arati_item.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class AratiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aarati"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _aratiBanner(context),
            _aratiList(context),
          ],
        ),
      ),
    );
  }

  Widget _aratiBanner(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.arati_banner),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Daily Aarati & Puja \nMantras",
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 24,
                  color: ColorManager.primary,
                ),
          ),
          SizedBox(
            height: AppSize.s4.w,
          ),
          Text(
            "Start listening now.",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: AppSize.s16.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search Aarati",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: ColorManager.grey.withOpacity(.3),
                    ),
              ),
              Icon(
                Icons.search,
                size: AppSize.s18,
              ),
            ],
          ).addBorder(context,
              borderRadius: 30,
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p20,
                vertical: AppPadding.p14,
              ))
        ],
      ).addPadding(
        padding: EdgeInsets.all(
          AppPadding.p20,
        ),
      ),
    ).addMargin();
    return Image.asset(
      ImageAssets.arati_banner,
      width: double.infinity,
      height: 160,
      fit: BoxFit.fill,
    ).addBorder(context,
        addBorder: false,
        clipBehaviour: Clip.antiAlias,
        margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m20, vertical: AppMargin.m10));
  }

  Widget _aratiList(BuildContext context) {
    return GetBuilder<AratiController>(
      builder: (aratiController) {
        if (aratiController.aratiModel != null) {
          if (aratiController.aratiModel!.data.isNotEmpty)
            return ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: aratiController.aratiModel!.data.length,
              itemBuilder: (context, index) {
                return AratiItem(aratiController.aratiModel!.data[index]);
              },
            ).addMargin();
        }
        return Center(
          child: Text("No Aratai found"),
        );
      },
    );
  }
}
