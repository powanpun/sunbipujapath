import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/font_manager.dart';
import 'package:puja_path/utils/values_manager.dart';
import 'package:puja_path/widgets/app_textfield_widget.dart';

class SignUpWidget extends StatelessWidget {
  final Function(String mobile, String password) callback;

  SignUpWidget({Key? key, required this.callback}) : super(key: key);

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
          Text("Sign Up",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: FontSize.s18.sp,
                  color: ColorManager.primary,
                  fontWeight: FontWeightManager.medium)),
          SizedBox(
            height: AppSize.s10.r * 3.8,
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
          SizedBox(height: AppSize.s20.r),
          Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s20))),
                onPressed: () => callback(
                  _userNameController.text,
                  _passwordController.text,
                ),
                child: Text(
                  "Sign Up",
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
