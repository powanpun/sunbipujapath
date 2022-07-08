import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/screens/home_page/widgets/featured_products/product_item.dart';
import 'package:puja_path/screens/home_page/widgets/home_header_widget.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class FeaturedProducts extends StatelessWidget {
  final String title;

  FeaturedProducts({this.title = "Featured Products"});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeHeaderWidget(
            title: title,
          ),
          SizedBox(
            height: AppSize.s20.r,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductItem(),
                SizedBox(
                  width: 10.r,
                ),
                ProductItem(),
                SizedBox(
                  width: 10.r,
                ),
                ProductItem(),
                SizedBox(
                  width: 10.r,
                ),
                ProductItem(),
              ],
            ),
          )
        ],
      ),
    ).addMargin();
  }
}
