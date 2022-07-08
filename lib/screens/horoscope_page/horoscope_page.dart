import 'package:flutter/material.dart';
import 'package:puja_path/screens/horoscope_page/daily_horoscope.dart';
import 'package:puja_path/screens/horoscope_page/widget/tabbar_text_wigdet.dart';

class HoroscopePage extends StatelessWidget {
  const HoroscopePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Horoscope"),
          bottom: TabBar(
            onTap: (index) {},
            tabs: horoscopeTab(),
          ),
        ),
        body: TabBarView(children: [
          DailyHoroscope(),
          DailyHoroscope(),
          DailyHoroscope(),
          DailyHoroscope()
        ]),
      ),
    );
  }

  horoscopeTab() {
    return [
      Tab(
        child: TabBarTextWidget(text: "Daily"),
      ),
      Tab(
        child: TabBarTextWidget(text: "Weekly"),
      ),
      Tab(
        child: TabBarTextWidget(text: "Monthly"),
      ),
      Tab(
        child: TabBarTextWidget(text: "Yearly"),
      ),
    ];
  }
}
