import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puja_path/getx/auth_and_user_controller.dart';
import 'package:puja_path/screens/home_page/widgets/featured_products/featured_products.dart';
import 'package:puja_path/screens/home_page/widgets/home_header_widget.dart';
import 'package:puja_path/screens/profile_page/widgets/detail_widget.dart';
import 'package:puja_path/screens/profile_page/widgets/profile_action_widget.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final AuthAndUserController _authAndUserController = Get.find();

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
      //   title: Text("Profile"),
      // ),
      body: FadeTransition(
        opacity: animation,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getProfileDetails(context),
              _getHoroscopeDetails(context),
              _getProfileActions(context),
              _getVoucherWidget(context),
              _getHoroscopeEssentialWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getProfileDetails(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImageAssets.rudrakhsya,
          fit: BoxFit.cover,
          height: 69,
          width: 69,
        ).addBorder(
          context,
          borderRadius: 50,
          addBorder: false,
          clipBehaviour: Clip.antiAlias,
        ),
        SizedBox(
          width: AppSize.s20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // _authAndUserController.loginModel!.name ?? "",
                "john",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: AppSize.s10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailWidget(
                    icon: Icons.phone,
                    // text: _authAndUserController.loginModel!.phone ?? "",
                    text: "john",
                  ),
                  DetailWidget(
                    icon: Icons.calendar_today_outlined,
                    // text: _authAndUserController.loginModel!.email ?? "",
                    text: "asds",
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s24,
              ),
              Text(
                "Edit Profile",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 12),
              ).addBorder(
                context,
                color: Colors.transparent,
                padding: EdgeInsets.all(8),
              )
            ],
          ),
        ),
      ],
    ).addBorder(context,
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: AppPadding.p16,
        ),
        margin: EdgeInsets.only(bottom: AppMargin.m14),
        borderRadius: 0,
        addBorder: false,
        color: ColorManager.primaryLight);
  }

  Widget _getHoroscopeDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeHeaderWidget(
          title: "Your Horoscope",
        )
        //TODO add horoscope views here
      ],
    ).addMargin();
  }

  Widget _getProfileActions(BuildContext context) {
    return Column(
      children: [
        ProfileActionWidget(
          icon: Icons.add,
          text: "Add family members Horoscope",
        ),
        SizedBox(
          height: 5,
        ),
        ProfileActionWidget(
          icon: Icons.history,
          text: "Purchase History",
        ),
        SizedBox(
          height: 5,
        ),
        ProfileActionWidget(
          icon: Icons.bookmark_outline,
          text: "Offers & Coupons",
        ),
      ],
    );
  }

  Widget _getVoucherWidget(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          ImageAssets.icon_gift,
          height: AppSize.s28,
          width: AppSize.s16,
        ).addBorder(
          context,
          addBorder: false,
          borderRadius: AppSize.s10,
          padding: EdgeInsets.all(AppPadding.p10),
          color: ColorManager.ratingColor.withOpacity(.06),
        ),
        SizedBox(
          width: AppSize.s20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gift Vouchers",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              SizedBox(
                height: AppSize.s4,
              ),
              Text(
                "Send some blessings to your \nloved ones.",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: ColorManager.lightBlack,
                    ),
              ),
            ],
          ),
        ),
        Text(
          "Get Now",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: ColorManager.white,
              ),
        ).addBorder(
          context,
          color: ColorManager.ratingColor,
          borderRadius: 6,
          addBorder: false,
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.p8,
            horizontal: AppPadding.p20,
          ),
        )
      ],
    ).addBorder(context,
        margin: EdgeInsets.symmetric(
          horizontal: AppMargin.m20,
          vertical: AppMargin.m10,
        ),
        padding: EdgeInsets.all(AppPadding.p10));
  }

  Widget _getHoroscopeEssentialWidget(BuildContext context) {
    return FeaturedProducts(title: "Horoscope Essentials");
  }
}
