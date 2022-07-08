import 'package:flutter/material.dart';
import 'package:puja_path/screens/product_details_page/product_details_page.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class ProductItem extends StatefulWidget {
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Column(
        children: [
          _getProductImage(),
          _getProductDesc(context),
        ],
      ).addBorder(
        context,
        clipBehaviour: Clip.antiAlias,
      ),
    );
  }

  Widget _getProductImage() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductDetailsPage()));
      },
      child: Image.asset(
        ImageAssets.rudrakhsya,
        width: 160,
        height: 120,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _getProductName(BuildContext context) {
    return Text(
      "Rudrakshya - 5 Mukhi",
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Widget _getProductPrice(BuildContext context) {
    return Text(
      "NPR 450",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Widget _getProductActions(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_outline,
            size: 14,
            color: isFav ? ColorManager.ratingColor : ColorManager.grey,
          ).addBorder(
            context,
            padding: EdgeInsets.all(6),
          ),
          onTap: () {
            setState(() {
              isFav = !isFav;
            });
          },
        ),
        SizedBox(
          width: AppSize.s8,
        ),
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.add_circle_outline,
                size: AppSize.s12,
              ),
              SizedBox(
                width: AppSize.s8,
              ),
              Text(
                "Add to cart",
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ).addBorder(
            context,
            borderRadius: AppSize.s12,
            padding: EdgeInsets.all(6),
          ),
        ),
      ],
    );
  }

  Widget _getProductDesc(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getProductName(context),
        SizedBox(
          height: AppSize.s12,
        ),
        _getProductPrice(context),
        SizedBox(
          height: AppSize.s12,
        ),
        _getProductActions(context),
      ],
    ).addPadding(
        padding: EdgeInsets.symmetric(
      horizontal: AppMargin.m10,
      vertical: AppMargin.m8,
    ));
  }
}
