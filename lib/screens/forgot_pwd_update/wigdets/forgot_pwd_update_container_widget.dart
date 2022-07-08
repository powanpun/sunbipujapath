import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/getx/auth_and_user_controller.dart';
import 'package:puja_path/screens/login_page/login_page.dart';
import 'package:puja_path/utils/color_manager.dart';
import 'package:puja_path/utils/toast.dart';
import 'package:puja_path/utils/values_manager.dart';
import 'package:puja_path/widgets/app_textfield_widget.dart';

class ForgotPwdUpdateContainerWidget extends StatelessWidget {
  ForgotPwdUpdateContainerWidget({Key? key}) : super(key: key);

  final AuthAndUserController _controller = Get.find();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.r),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.s10.r * 3.7,
          ),
          Text(
            "Change Password",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                color: ColorManager.darkPrimary, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: AppSize.s10.r * 3.8,
          ),
          AppTextFieldWidget(
            text: "Password",
            textFieldHint: "Enter a new password",
            textEditingController: _passwordController,
            obscureText: true,
          ),
          SizedBox(
            height: AppSize.s24.r,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  var password = _passwordController.text.toString();
                  if (password.length > 7) {
                    _controller.password = password;
                    var result = await _controller.updateForgotPassword();
                    if (result.isSuccess()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (ctx) => LoginPage()),
                          (Route<dynamic> route) => false);
                    }
                  } else {
                    errorToast("Password should be more than 7 characters");
                  }
                },
                child: Text(
                  "Change Password",
                  style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.w400),
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
