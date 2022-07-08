import 'package:flutter/material.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class BazaarBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Image.asset(
            ImageAssets.bazaar_banner,
            height: 150,
            width: 300,
          ).addBorder(context, addBorder: false, clipBehaviour: Clip.antiAlias),
          SizedBox(
            width: AppSize.s18,
          ),
          Image.asset(
            ImageAssets.bazaar_banner,
            height: 150,
            width: 300,
          ).addBorder(context, addBorder: false, clipBehaviour: Clip.antiAlias),
        ],
      ),
    ).addMargin(margin: EdgeInsets.all(AppMargin.m20));
  }
}
