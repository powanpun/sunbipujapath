import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:puja_path/utils/extensions/extension.dart';
import 'package:puja_path/utils/values_manager.dart';

import 'widget/otp_verification_widget.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
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
                  child: SvgPicture.asset("assets/images/ellipse.svg"),
                ),
                SizedBox(
                  height: AppSize.s48,
                ),
                OtpVerificationWidget().addPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppPadding.p16.r)),
                SizedBox(
                  height: AppSize.s24 * 2,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
