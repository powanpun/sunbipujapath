import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/getx/arati_controller.dart';
import 'package:puja_path/getx/horoscope_controller.dart';
import 'package:puja_path/screens/arati_page/arati_page.dart';
import 'package:puja_path/screens/home_page/widgets/featured_services/featured_service_item.dart';
import 'package:puja_path/screens/home_page/widgets/home_header_widget.dart';
import 'package:puja_path/screens/horoscope_page/horoscope_page.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class FeaturedServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeHeaderWidget(
            title: "Featured Services",
          ),
          SizedBox(
            height: AppSize.s20.r,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FeaturedServiceItem(
                  iconName: ImageAssets.icon_horoscope,
                  serviceName: "Horoscope",
                  onServiceClick: (String feature) {
                    HoroscopeController().getHoroscope();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HoroscopePage()));
                  },
                ),
                SizedBox(
                  width: 10.r,
                ),
                FeaturedServiceItem(
                  iconName: ImageAssets.icon_arati,
                  serviceName: "Arati",
                  onServiceClick: (String feature) {
                    AratiController().getAratiList();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AratiPage()));
                  },
                ),
                SizedBox(
                  width: 10.r,
                ),
                FeaturedServiceItem(
                  iconName: ImageAssets.icon_personal,
                  serviceName: "Personal\nEvents",
                  onServiceClick: (String feature) {},
                ),
                SizedBox(
                  width: 10.r,
                ),
                FeaturedServiceItem(
                  iconName: ImageAssets.icon_pandit,
                  serviceName: "Pandit\nConsultant",
                  onServiceClick: (String feature) {},
                ),
              ],
            ),
          )
        ],
      ),
    ).addMargin();
  }
}
