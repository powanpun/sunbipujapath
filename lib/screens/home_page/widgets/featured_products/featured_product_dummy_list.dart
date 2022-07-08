import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/screens/home_page/widgets/featured_products/product_item.dart';
import 'package:puja_path/screens/home_page/widgets/home_header_widget.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class FeaturedProductsDummyList extends StatefulWidget {
  final String title;

  FeaturedProductsDummyList({this.title = "Featured Products"});

  @override
  State<FeaturedProductsDummyList> createState() =>
      _FeaturedProductsDummyListState();
}

class _FeaturedProductsDummyListState extends State<FeaturedProductsDummyList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeHeaderWidget(
            title: widget.title,
          ),
          SizedBox(
            height: AppSize.s20.r,
          ),
          SizedBox(
            height: 240,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 8,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem();
                }),
          ),
        ],
      ),
    ).addMargin();
  }
}
