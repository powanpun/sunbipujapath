import 'package:flutter/material.dart';
import 'package:puja_path/screens/home_page/widgets/banner_wiget.dart';
import 'package:puja_path/screens/home_page/widgets/featured_products/featured_products.dart';
import 'package:puja_path/screens/home_page/widgets/featured_services/featured_services.dart';
import 'package:puja_path/screens/home_page/widgets/today_widget.dart';
import 'package:puja_path/screens/home_page/widgets/upcoming_events/upcoming_events.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // AnimationController is a stateful resource that needs to be disposed when
    // this State gets disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Puja Path"),
      // ),
      body: FadeTransition(
        opacity: animation,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TodayWidget(),
              BannerWidget(),
              UpcomingEvents(),
              FeaturedServices(),
              FeaturedProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
