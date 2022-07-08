import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/getx/auth_and_user_controller.dart';
import 'package:puja_path/screens/otp_page/otp_verification_page.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/toast.dart';
import 'package:puja_path/utils/values_manager.dart';
import 'package:puja_path/widgets/app_textfield_widget.dart';

import '../../../utils/font_manager.dart';

class ForgotPasswordContainerWidget extends StatelessWidget {
  ForgotPasswordContainerWidget({Key? key}) : super(key: key);

  final AuthAndUserController _controller = Get.find();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.r),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.s10.r * 3.7,
          ),
          Text(
            "Forgot Password",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: FontSize.s20.sp,
                color: ColorManager.primary,
                fontWeight: FontWeightManager.medium),
          ),
          // Text(
          //   "Forgot Password",
          //   style: Theme.of(context).textTheme.headline5?.copyWith(
          //       color: ColorManager.darkPrimary, fontWeight: FontWeight.w600),
          // ),
          SizedBox(
            height: AppSize.s10.r * 3.8,
          ),
          AppTextFieldWidget(
            text: "Mobile Number",
            textFieldHint: "Enter Mobile Number",
            textEditingController: _userNameController,
          ),
          SizedBox(
            height: AppSize.s24.r,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s20))),
                onPressed: () async {
                  var mobileNumber = _userNameController.text.toString();
                  if (mobileNumber.length == 10 && mobileNumber.isNumericOnly) {
                    _controller.mobileNumber = mobileNumber;
                    Result result = await _controller.sendForgotPasswordOTP(
                        context, mobileNumber);
                    if (result.isSuccess()) {
                      _controller.otpForForgotPwd = true;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => OtpPage()));
                    }
                  } else {
                    errorToast("Mobile Number should be valid");
                  }
                },
                child: Text(
                  "Change Password",
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
