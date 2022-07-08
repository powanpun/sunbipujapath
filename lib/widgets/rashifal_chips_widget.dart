import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/values_manager.dart';

class RashifalListWigdet extends StatefulWidget {
  const RashifalListWigdet({Key? key}) : super(key: key);

  @override
  _RashifalListWigdetState createState() => _RashifalListWigdetState();
}

class _RashifalListWigdetState extends State<RashifalListWigdet> {
  List<RashifalModel> rashifalList = [
    RashifalModel("Mesh", false),
    RashifalModel("Brish", false),
    RashifalModel("Mitthun", false),
    RashifalModel("Karkat", false),
    RashifalModel("Singha", false),
    RashifalModel("Kanya", false),
    RashifalModel("Tula", false),
    RashifalModel("Brishyik", false),
    RashifalModel("Dhanu", false),
    RashifalModel("Makkar", false),
    RashifalModel("Khumba", false),
    RashifalModel("Min", false),
  ];

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rasi",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: AppSize.s14,
          ),
          Wrap(
            children: [
              ...List.generate(rashifalList.length,
                  (index) => _getBloodGroupList(rashifalList, index))
            ],
          ),
        ],
      ),
    );
  }

  _getBloodGroupList(List<RashifalModel> rashifalGroupList, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rashifalGroupList.forEach((element) => element.isSelected = false);
          rashifalGroupList[index].isSelected = true;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: AppPadding.p12, bottom: AppPadding.p14),
        child: Container(
          width: 70.r,
          padding: EdgeInsets.symmetric(vertical: AppPadding.p12.r),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                width: .25,
                color: rashifalGroupList[index].isSelected
                    ? Colors.red
                    : ColorManager.primary),
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Center(child: Text(rashifalGroupList[index].rashifal,style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: FontSize.s14.sp,
              fontWeight: FontWeightManager.regular),)),
        ),
      ),
    );
  }
}

class RashifalModel {
  String rashifal;
  bool isSelected;

  RashifalModel(this.rashifal, this.isSelected);
}
