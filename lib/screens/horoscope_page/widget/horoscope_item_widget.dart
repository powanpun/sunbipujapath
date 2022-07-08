import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/values_manager.dart';

class HoroscopeItemWidget extends StatefulWidget {
  const HoroscopeItemWidget(int index, {Key? key}) : super(key: key);

  @override
  _HoroscopeItemWidgetState createState() => _HoroscopeItemWidgetState();
}

class _HoroscopeItemWidgetState extends State<HoroscopeItemWidget> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _topRow(() {
            setState(() {
              expand = !expand;
            });
          }),
          _expandableHoroscopeDetail()
        ],
      ).addBorder(
        context,
        borderRadius: AppSize.s20,
      ),
    ).addPadding(
        padding: EdgeInsets.only(
            left: AppPadding.p24.r,
            right: AppPadding.p24.r,
            top: AppPadding.p12.r));
  }

  _horoscopeField(String horoscope) {
    return Text(
      horoscope,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
          fontSize: FontSize.s12.sp, fontWeight: FontWeightManager.regular),
    );
  }

  _shareButton() {
    return Align(
      alignment: Alignment.topRight,
      child: SvgPicture.asset(
        "assets/images/icon_feather_share.svg",
        width: AppSize.s14,
        height: AppSize.s14,
      ),
    );
  }

  _horoscopeStatus(String status) {
    return Text(
      status,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
          fontSize: FontSize.s14.sp, fontWeight: FontWeightManager.medium),
    );
  }

  _horoscopeRating(int rate) {
    List<RatingModel> list = [];
    for (int i = 0; i < 5; i++) {
      if (i < rate) {
        list.add(RatingModel(Colors.orangeAccent));
      } else {
        list.add(RatingModel(ColorManager.lightGrey));
      }
    }
    return Row(
      children: [
        ...List.generate(list.length, (index) => ratingIcon(list[index]))
      ],
    );
  }

  ratingIcon(RatingModel ratingModel) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0),
      child: Icon(
        Icons.star,
        color: ratingModel.color,
        size: AppSize.s14,
      ),
    );
  }

  _detailButton() {
    return Row(
      children: [
        Text(
          "Detail",
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontWeight: FontWeightManager.regular, fontSize: FontSize.s12.sp),
        ),
        Icon(
          Icons.arrow_back_ios_outlined,
          size: AppSize.s8,
        )
      ],
    );
  }

  _topRow(Function onClick) {
    return Row(
      children: [
        Container(
          child: Image.asset(
            "assets/images/icon_horoscope.png",
            width: AppSize.s28,
            height: AppSize.s28,
          ).addPadding(
              padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p12, horizontal: AppPadding.p12)),
        ).addBorder(context,
            addBorder: false,
            borderRadius: AppSize.s10,
            color: ColorManager.softPeach),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _horoscopeField(
                "Tula(you)",
              ),
              SizedBox(
                height: AppSize.s4,
              ),
              _horoscopeStatus("Moderately Okay"),
              SizedBox(
                height: AppSize.s4,
              ),
              _horoscopeRating(3),
            ],
          ).addPadding(padding: EdgeInsets.only(left: AppPadding.p18.r)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _shareButton(),
            SizedBox(
              height: AppSize.s28,
            ),
            GestureDetector(
              child: _detailButton(),
              onTap: () => onClick(),
            )
          ],
        )
      ],
    ).addPadding(
        padding: EdgeInsets.only(
            left: AppPadding.p10.r,
            right: AppPadding.p10.r,
            top: AppPadding.p12.r));
  }

  _expandableHoroscopeDetail() {
    return expand
        ? Column(
            children: [
              Container(
                color: ColorManager.lightGrey,
                height: .5,
              ).addPadding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p10.r)),
              Text(
                "You will have feeling of peace in heart. There’s a chance to meet old and forgotten friend. High chances of you getting close to your aim.",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontSize: FontSize.s14.sp,
                    fontWeight: FontWeightManager.regular),
              )
            ],
          ).addPadding(
            padding: EdgeInsets.only(
                left: AppPadding.p10.r,
                right: AppPadding.p10.r,
                top: AppPadding.p10.r,
                bottom: AppPadding.p20.r))
        : Container()
            .addPadding(padding: EdgeInsets.only(bottom: AppPadding.p10.r));
  }
}

class RatingModel {
  final Color color;

  RatingModel(this.color);
}
