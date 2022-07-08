import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puja_path/getx/horoscope_controller.dart';
import 'package:puja_path/screens/horoscope_page/all_horoscope_list.dart';
import 'package:puja_path/screens/horoscope_page/selected_horoscope_list_widget.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class DailyHoroscope extends StatelessWidget {
  DailyHoroscope({Key? key}) : super(key: key);

  final HoroscopeController _horoscopeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HoroscopeController>(
      builder: (controller) {
        if (controller.horoscopeModel == null)
          return Center(
            child: CircularProgressIndicator(),
          );
        return CustomScrollView(
          slivers: [
            SelectedHoroscopeList(),
            SliverToBoxAdapter(
                child: Container(
              color: ColorManager.lightGrey,
              height: .5,
            ).addPadding(
                    padding: EdgeInsets.only(
                        bottom: AppPadding.p10.r,
                        top: AppPadding.p20.r,
                        left: AppPadding.p30.r,
                        right: AppPadding.p30.r))),
            AllHoroscopeList(),
          ],
        );
      },
    );
  }
}
