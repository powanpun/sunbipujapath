import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puja_path/getx/home_getx_controller.dart';
import 'package:puja_path/model/dashboard_tab_model.dart';
import 'package:puja_path/screens/bazaar_page/bazaar_page.dart';
import 'package:puja_path/screens/home_page/home_page.dart';
import 'package:puja_path/screens/profile_page/profile_page.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/enum_constants.dart';
import 'package:puja_path/utils/values_manager.dart';

import '../../utils/utils.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  List<DashboardTabModel> tabs = [
    DashboardTabModel(ImageAssets.icon_explore, 'Home', DASHBOARD_TAB.HOME),
    DashboardTabModel(ImageAssets.icon_consultation, 'Consultation',
        DASHBOARD_TAB.CONSULTATION),
    DashboardTabModel(ImageAssets.icon_bazaar, 'Bazaar', DASHBOARD_TAB.BAZAAR),
    DashboardTabModel(ImageAssets.icon_notification, 'Notifications',
        DASHBOARD_TAB.NOTIFICATIONS),
    DashboardTabModel(
        ImageAssets.icon_notification, 'Profile', DASHBOARD_TAB.PROFILE),
  ];

  final HomeGetxController _homeController = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _homeController.fetch();
    });
    super.initState();
  }

  List<Widget> pages = [
    HomePage(),
    HomePage(),
    BazaarPage(),
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return true;
        } else {
          setState(() {
            _selectedIndex = 0;
          });
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Utils.getAppBarTextAndIcon(),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: AppPadding.p10),
          child: FloatingActionButton(
            onPressed: () {
              _openBazaarPage();
            },
            child: Image.asset(
              ImageAssets.icon_bazaar,
              height: AppSize.s24,
              width: AppSize.s24,
            ),
            backgroundColor: ColorManager.primary,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: pages[_selectedIndex],
        bottomNavigationBar: getBottomTabs(context),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                ),
                child: Center(
                  child: Container(
                    width: 127.r,
                    height: 127.r,
                    // child: SvgPicture.asset("assets/images/ellipse.svg"),

                    child: Image.asset(ImageAssets.logo_png),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  getBottomTabs(context) {
    return Container(
        child: SafeArea(
      bottom: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black12,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(5, (index) {
                  return _getBottomNavItem(index);
                })
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _getBottomNavItem(int index) {
    return Expanded(
      flex: 3,
      child: GestureDetector(
        onTap: () {
          if (index == 2) {
            _openBazaarPage();
          } else {
            _selectedIndex = index;
            setState(() {});
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              index == 2
                  ? Container(
                      height: AppSize.s28,
                    )
                  : Image.asset(
                      tabs[index].tabIcon,
                      height: AppSize.s28,
                      width: AppSize.s28,
                      color: _selectedIndex == index
                          ? ColorManager.primary
                          : ColorManager.grey,
                    ),
              SizedBox(
                height: AppSize.s4,
              ),
              Text(
                tabs[index].title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: _selectedIndex == index
                          ? ColorManager.primary
                          : ColorManager.grey,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMiddleNavItem(int index) {
    return Expanded(
      flex: 3,
      child: GestureDetector(
        onTap: () {
          _selectedIndex = index;
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                tabs[index].tabIcon,
                height: AppSize.s28,
                width: AppSize.s28,
              ),
              SizedBox(
                height: AppSize.s4,
              ),
              Text(
                tabs[index].title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openBazaarPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BazaarPage()));
  }
}
