import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puja_path/getx/app_getx_controller.dart';

class Splash extends StatelessWidget {

  AppGetXController _appGetXController = Get.find();

  @override
  Widget build(BuildContext context) {

    _appGetXController.onSplashStart(context);

    return Container();
  }
}
