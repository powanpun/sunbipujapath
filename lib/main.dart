import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puja_path/screens/splash.dart';
import 'package:puja_path/utils/theme_manager.dart';

import 'getx/app_getx_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppGetXController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 100),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Puja Path',
          theme: getApplicationTheme(),
          home: Splash(),
        );
      },
    );
  }
}
