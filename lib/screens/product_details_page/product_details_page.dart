import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int productQuantity = 1;
  bool isFav = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _productImage(context),
                  _productImageList(context),
                  Container(
                      color: ColorManager.white,
                      child: Column(
                        children: [
                          _productTitle(context),
                          _productRating(context),
                          _productPrice(context),
                        ],
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      color: ColorManager.white,
                      child: _productDescription(context)),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      color: ColorManager.white,
                      child: _productReview(context)),
                  SizedBox(
                    height: 64,
                  ),
                ],
              ),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter, child: _productCTA(context)),
        ],
      ),
    );
  }

  Widget _productImage(BuildContext context) {
    return Image.asset(
      ImageAssets.rudrakhsya,
      width: double.infinity,
      height: 300,
      fit: BoxFit.cover,
    ).addBorder(context,
        addBorder: false,
        clipBehaviour: Clip.antiAlias,
        margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m20, vertical: AppMargin.m10));
  }

  Widget _productImageList(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Image.asset(
            ImageAssets.rudrakhsya,
            fit: BoxFit.cover,
          ).addBorder(context,
              addBorder: false,
              clipBehaviour: Clip.antiAlias,
              borderRadius: 14,
              margin: EdgeInsets.symmetric(horizontal: 4));
        },
      ).addMargin(),
    );
  }

  Widget _productTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "Consecrated Copper Ring - Medium (Snake Ring / Sarpasutra)",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(
          width: AppSize.s16,
        ),
        IconButton(
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_outline,
            size: 18,
            color: isFav ? ColorManager.ratingColor : ColorManager.grey,
          ).addBorder(
            context,
            padding: EdgeInsets.all(6),
          ),
          onPressed: () {
            setState(() {
              isFav = !isFav;
            });
          },
        ),
      ],
    ).addMargin();
  }

  Widget _productRating(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: ColorManager.ratingColor,
          ),
          itemSize: AppSize.s24,
          onRatingUpdate: (rating) {},
        ),
        SizedBox(
          width: AppSize.s8,
        ),
        RichText(
          text: TextSpan(
            text: "5/5",
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: " (51 Reviews)",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    ).addMargin();
  }

  Widget _productPrice(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "NPR 250",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: ColorManager.primary,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Text(
              "(inclusive of all taxes)",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: ColorManager.lightBlack,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  productQuantity > 1 ? productQuantity -= 1 : null;
                });
              },
              child: Container(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.remove,
                    size: AppSize.s16,
                  )).addBorder(
                context,
                borderRadius: 4,
              ),
            ),
            SizedBox(
              width: AppSize.s24,
            ),
            Text(
              productQuantity.toString(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: ColorManager.primary,
                  ),
            ),
            SizedBox(
              width: AppSize.s24,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  productQuantity += 1;
                });
              },
              child: Container(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.add,
                    size: AppSize.s16,
                  )).addBorder(
                context,
                borderRadius: 4,
              ),
            ),
          ],
        ),
      ],
    ).addMargin();
  }

  Widget _productDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Descriptions",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: AppSize.s20,
        ),
        // Text(
        //   "In Yogic tradition, the ring finger has an important role to play in rituals. If you want to take vibhuthi or kumkum, you use this finger to apply it. Wearing a metal ring, especially made of copper, by a see…",
        //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
        //         fontWeight: FontWeight.w400,
        //         height: 2,
        //       ),
        // ),
        ConstrainedBox(
            constraints: isExpanded
                ? new BoxConstraints()
                : new BoxConstraints(maxHeight: 60.0),
            child: new Text(
              "In Yogic tradition, the ring finger has an important role to play in rituals. If you want to take vibhuthi or kumkum, you use this  asdasdasd asda sds finger to apply it. Wearing a metal ring, especially made of copper, by a see  ring finger has an important role to play in rituals. If you want to take vibhuthi or kumkum, you use thi  asda",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w400, height: 2),
              softWrap: true,
              overflow: TextOverflow.fade,
            )),

        SizedBox(
          height: AppSize.s12,
        ),
        InkWell(
          onTap: () => setState(() {
            isExpanded = !isExpanded;
          }),
          child: Center(
              child: Text(
            isExpanded ? "Read Less" : "Read More",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: ColorManager.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
          )),
        )
      ],
    ).addMargin();
  }

  Widget _productReview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ratings & Reviews",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Write a review",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: ColorManager.primary,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: AppSize.s20,
        ),
        Text(
          "Amazing Buy",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(
          height: AppSize.s12,
        ),
        RatingBar.builder(
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: ColorManager.ratingColor,
          ),
          itemSize: AppSize.s18,
          onRatingUpdate: (rating) {},
        ),
        SizedBox(
          height: AppSize.s12,
        ),
        Text(
          "Copper ring is perfectly crafted and it’s really gonna bring stability to your system!!!Foreal",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
        SizedBox(
          height: AppSize.s12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Review by Gaurav",
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w400, color: ColorManager.lightGrey),
            ),
            Text(
              "Sep 12,2021",
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        )
      ],
    ).addMargin();
  }

  Widget _productCTA(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: AppSize.s20,
                  color: Colors.white,
                ),
                SizedBox(
                  width: AppSize.s8,
                ),
                Text(
                  "Add to Cart",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: ColorManager.white, fontSize: 18),
                )
              ],
            ).addBorder(
              context,
              padding: EdgeInsets.all(AppSize.s12),
              addBorder: false,
              color: ColorManager.primary,
            ),
          ),
          SizedBox(
            width: AppSize.s10,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.icon_bazaar,
                  height: AppSize.s20,
                  width: AppSize.s20,
                ),
                SizedBox(
                  width: AppSize.s8,
                ),
                Text(
                  "Buy Now",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: ColorManager.white, fontSize: 18),
                )
              ],
            ).addBorder(
              context,
              padding: EdgeInsets.all(AppSize.s12),
              addBorder: false,
              color: ColorManager.ratingColor,
            ),
          ),
        ],
      ).addMargin(),
    );
  }
}
