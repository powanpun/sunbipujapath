import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/getx/auth_and_user_controller.dart';
import 'package:puja_path/screens/login_page/login_page.dart';
import 'package:puja_path/screens/otp_page/otp_verification_page.dart';
import 'package:puja_path/screens/sign_up_page/widget/sign_up_widget.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/toast.dart';
import 'package:puja_path/utils/values_manager.dart';

import '../../utils/assets_manager.dart';
import '../../utils/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthAndUserController _controller = Get.find();

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
                  height: AppSize.s48.r,
                ),
                Container(
                  width: 127.r,
                  height: 127.r,
                  // child: SvgPicture.asset("assets/images/ellipse.svg"),

                  child: Image.asset(ImageAssets.logo_png),
                ),
                SizedBox(
                  height: AppSize.s48.r,
                ),
                SignUpWidget(callback: (mobile, password) async {
                  if (mobile.length == 10 && mobile.isNumericOnly) {
                    if (password.length > 7) {
                      _controller.mobileNumber = mobile;
                      _controller.password = password;
                      Result result =
                          await _controller.sendOTP(context, mobile);
                      if (result.isSuccess()) {
                        _controller.otpForForgotPwd = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const OtpPage()));
                      }
                    } else {
                      errorToast(
                          "Password should contain 8 characters and at least one number");
                    }
                  } else {
                    errorToast("Mobile Number not valid");
                  }
                }).addPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppPadding.p16.r)),
                SizedBox(
                  height: AppSize.s10.r * 3.7,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => const LoginPage()));
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Already have an account? ",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: FontSize.s14.sp)),
                    TextSpan(
                        text: "Log in",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: FontSize.s14.sp,
                            color: ColorManager.ratingColor)),
                  ])),
                ),
                SizedBox(
                  height: AppSize.s10.r * 5.7,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
