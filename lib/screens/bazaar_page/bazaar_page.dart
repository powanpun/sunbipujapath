import 'package:flutter/material.dart';
import 'package:puja_path/screens/bazaar_page/widgets/bazaar_banner.dart';
import 'package:puja_path/screens/home_page/widgets/featured_products/featured_product_dummy_list.dart';
import 'package:puja_path/screens/home_page/widgets/featured_products/featured_products.dart';

class BazaarPage extends StatefulWidget {
  @override
  State<BazaarPage> createState() => _BazaarPageState();
}

class _BazaarPageState extends State<BazaarPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

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
      appBar: AppBar(
        title: Text("Puja Path"),
      ),
      body: FadeTransition(
        opacity: animation,
        child: SingleChildScrollView(
            child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Column(
                    children: [
                      BazaarBanner(),
                      FeaturedProductsDummyList(),
                      FeaturedProducts(),
                      FeaturedProducts(
                        title: "Best Seller",
                      ),
                    ],
                  );
                })),
      ),
    );
  }
}
