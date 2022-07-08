import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:puja_path/screens/login_page/widget/login_container_widget.dart';
import 'package:puja_path/screens/otp_page/otp_verification_page.dart';
import 'package:puja_path/screens/sign_up_page/sign_up_page.dart';
import 'package:puja_path/utils/assets_manager.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/styles_manager.dart';
import 'package:puja_path/utils/utils.dart';
import 'package:puja_path/utils/values_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Utils.getAppBarText(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: AppSize.s48,
                ),
                Container(
                  width: 127.r,
                  height: 127.r,
                  // child: SvgPicture.asset("assets/images/ellipse.svg"),
                  child: Image.asset(ImageAssets.logo_png),
                ),
                SizedBox(
                  height: AppSize.s48,
                ),
                LoginContainerWidget().addPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppPadding.p16.r)),
                SizedBox(
                  height: AppSize.s10 * 3.7,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => SignUpPage()));
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Dont have an Account? ",
                      style: getRegularStyle(
                        fontSize: FontSize.s14.sp,
                      ),
                    ),
                    TextSpan(
                        text: "Sign Up",
                        style: getRegularStyle(
                            fontSize: FontSize.s14.sp,
                            color: ColorManager.primary)),
                  ])),
                ),
                SizedBox(
                  height: AppSize.s10 * 5.7,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
