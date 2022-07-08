import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/screens/forgot_pwd_update/wigdets/forgot_pwd_update_container_widget.dart';
import 'package:puja_path/utils/utils.dart';
import 'package:puja_path/utils/values_manager.dart';

class ForgotPwdUpdatePage extends StatefulWidget {
  const ForgotPwdUpdatePage({Key? key}) : super(key: key);

  @override
  _ForgotPwdUpdatePageState createState() => _ForgotPwdUpdatePageState();
}

class _ForgotPwdUpdatePageState extends State<ForgotPwdUpdatePage> {
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
                  height: AppSize.s24.r * 2,
                ),
                Container(
                  width: 300.r,
                  height: 200.r,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/login_page_image.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s24.r * 2,
                ),
                ForgotPwdUpdateContainerWidget().addPadding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p24)),
                SizedBox(
                  height: AppSize.s10.r * 3.7,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
