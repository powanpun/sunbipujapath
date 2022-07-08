import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/screens/home_page/widgets/home_header_widget.dart';
import 'package:puja_path/screens/home_page/widgets/upcoming_events/upcoming_event_item.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeHeaderWidget(
            title: "Upcoming Events",
          ),
          SizedBox(
            height: AppSize.s20.r,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UpcomingEventItem(),
                SizedBox(
                  width: 10.r,
                ),
                UpcomingEventItem(),
                SizedBox(
                  width: 10.r,
                ),
                UpcomingEventItem(),
                SizedBox(
                  width: 10.r,
                ),
                UpcomingEventItem(),
              ],
            ),
          )
        ],
      ),
    ).addMargin();
  }
}
