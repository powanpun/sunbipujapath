import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/screens/forgot_password_page/widgets/forgot_password_container_widget.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/utils.dart';
import 'package:puja_path/utils/values_manager.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Utils.getAppBarText(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: AppSize.s24.r * 2,
            ),
            // Container(
            //   width: 300.r,
            //   height: 200.r,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       fit: BoxFit.fill,
            //       image: AssetImage(ImageAssets.arati_banner),
            //     ),
            //   ),
            // ),
            Container(
              width: 127.r,
              height: 127.r,
              // child: SvgPicture.asset("assets/images/ellipse.svg"),

              child: Image.asset(ImageAssets.logo_png),
            ),
            SizedBox(
              height: AppSize.s24.r * 2,
            ),
            ForgotPasswordContainerWidget().addPadding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p24)),
            SizedBox(
              height: AppSize.s10.r * 3.7,
            ),
          ],
        )),
      ),
    );
  }
}
