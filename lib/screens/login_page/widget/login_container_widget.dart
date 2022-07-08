import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puja_path/getx/auth_and_user_controller.dart';
import 'package:puja_path/screens/forgot_password_page/forgot_password_page.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/toast.dart';
import 'package:puja_path/utils/values_manager.dart';
import 'package:puja_path/widgets/app_textfield_widget.dart';

import '../../dashboard/dashboard.dart';

class LoginContainerWidget extends StatelessWidget {
  LoginContainerWidget({Key? key}) : super(key: key);

  final AuthAndUserController _controller = Get.find();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.r),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppPadding.p14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.s10.r * 3.3,
          ),
          Text(
            "Login to Continue",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: FontSize.s20.sp,
                color: ColorManager.primary,
                fontWeight: FontWeightManager.medium),
          ),
          SizedBox(
            // height: AppSize.s10.r * 3.8,
            height: AppSize.s10.r * 4.8,
          ),
          AppTextFieldWidget(
            text: "Mobile Number",
            textFieldHint: "Enter Mobile Number",
            textEditingController: _userNameController,
          ),
          AppTextFieldWidget(
            text: "Password",
            textFieldHint: "Enter Password",
            obscureText: true,
            textEditingController: _passwordController,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => ForgotPasswordPage()));
            },
            child: Align(
              child: Text(
                "Forgot Password",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontSize: FontSize.s14.sp,
                    // color: ColorManager.primary,
                    fontWeight: FontWeightManager.light),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          SizedBox(height: AppSize.s20.r),
          Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: ColorManager.ratingColor,
                    // primary: ColorManager.darkPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s20))),
                onPressed: () {
                  var mobileNumber = _userNameController.text.toString();
                  var password = _passwordController.text.toString();
                  if (mobileNumber.length == 10 &&
                      _passwordController.text.isNotEmpty) {
                    // _controller.login(context, mobileNumber, password);

                    //for testing only pushing directly to dashboard without api call
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Dashboard()),
                        (Route<dynamic> route) => false);
                  } else {
                    errorToast("Mobile Number and Password should be valid");
                  }
                },
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 20.r, fontWeight: FontWeight.w400),
                ).addMargin(
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.r, vertical: 15.r)),
              )),
          SizedBox(
            height: AppSize.s10.r * 3.7,
          ),
        ],
      ),
    );
  }
}
