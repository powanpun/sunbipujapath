import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/getx/auth_and_user_controller.dart';
import 'package:puja_path/screens/forgot_pwd_update/forgot_pwd_update_page.dart';
import 'package:puja_path/screens/personal_credential_page/personal_credential_page.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/values_manager.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerificationWidget extends StatefulWidget {

  OtpVerificationWidget({Key? key}) : super(key: key);

  @override
  _OtpVerificationWidgetState createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {

  final TextEditingController _otpController = TextEditingController();

  bool _startTimer = false;

  final AuthAndUserController _controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.s38,
          ),
          Text(
            "OTP Verification",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                color: ColorManager.primary, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: AppSize.s24,
          ),
          Text(
            "Please enter the 6 digit code sent to your mobile number: ${_controller.mobileNumber ?? ""}",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontSize: FontSize.s16.sp),
          ),
          SizedBox(
            height: AppSize.s48,
          ),
          Container(
            height: 50.r,
            child: PinInputTextFormField(
              controller: _otpController,
              pinLength: 6,
              decoration: BoxLooseDecoration(
                gapSpace: 8.r,
                textStyle: Theme.of(context).textTheme.bodyText1,
                radius: Radius.circular(14.r),
                strokeWidth: 0.25,
                strokeColorBuilder: PinListenColorBuilder(
                  ColorManager.primary,
                  Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppSize.s48,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _startTimer = true;
                });
              },
              child: !_startTimer
                  ? RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Didn't get the code? ",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(fontSize: FontSize.s16.sp)),
                        TextSpan(
                            text: "Resend",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    fontSize: FontSize.s16.sp,
                                    color: ColorManager.primary)),
                      ]),
                    )
                  : Text(
                      "Your OTP will will arrive in 00:60 sec",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: FontSize.s16.sp),
                    ),
            ),
          ),
          SizedBox(
            height: AppSize.s48 * 2,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s20))),
                onPressed: () async {
                  if (_otpController.text.isNotEmpty) {
                    Result result = await _controller.verifyOTP(context,
                        _controller.mobileNumber!, _otpController.text);
                    if (result.isSuccess()) {
                      _controller.otp = _otpController.text;
                      if (!_controller.otpForForgotPwd!) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => PersonalCredentialPage()));
                      } else {
                        // open forgot pwe page
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => ForgotPwdUpdatePage()));
                      }
                    }
                  }
                },
                child: Text(
                  "Verify",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ).addMargin(
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.r, vertical: 15.r)),
              )),
          SizedBox(
            height: AppSize.s24,
          ),
        ],
      ),
    );
  }
}
