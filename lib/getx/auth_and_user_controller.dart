import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/model/login_response_model.dart';
import 'package:puja_path/repository/user_repository.dart';
import 'package:puja_path/screens/dashboard/dashboard.dart';
import 'package:puja_path/utils/dialog_utils.dart';
import 'package:puja_path/utils/toast.dart';

class AuthAndUserController extends GetxController {
  final UserRepository _userRepository = UserRepository();

  LoginModel? _loginModel;

  LoginModel? get loginModel => _loginModel;

  String? mobileNumber;
  String? password;
  String? otp;
  bool? _otpForForgotPwd;

  set loginModel(LoginModel? value) {
    _loginModel = value;
  }

  bool? get otpForForgotPwd => _otpForForgotPwd;

  set otpForForgotPwd(bool? value) {
    _otpForForgotPwd = value;
    update();
  }

  login(BuildContext context, String phone, String password) async {
    DialogUtils.showLoadingDialog(context, dismissable: false);
    var body = {
      "countryCode": "977",
      "phone": phone,
      "password": password,
      // "deviceName": await Utils.getDevice(),
      "deviceType": Platform.operatingSystem,
      "deviceToken": ""
    };
    Result result = await _userRepository.userLogin(body);
    if (result.isSuccess() == true) {
      final LoginResponseModel loginResponseModel = await compute(
          loginResponseModelFromMap, jsonEncode(result.getValue()));
      successToast(loginResponseModel.message ?? '');
      _userRepository
          .putAuthTokenToPref(loginResponseModel.data?.accessToken ?? "");
      _userRepository
          .putLoginModelToPref(jsonEncode(loginResponseModel.data?.toMap()));
      _loginModel = loginResponseModel.data;
      Navigator.pop(context);
      update();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Dashboard()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.pop(context);
      errorToast(result.getErrorMsg()?.message ?? '');
    }
    return result;
  }

  Future<String> getAuthTokenFromPref() async {
    return _userRepository.getAuthTokenFromPref();
  }

  void getUserDetailsFromPref() async {
    String loginModel = await _userRepository.getLoginModelFromPref();
    _loginModel = LoginModel.fromMap(jsonDecode(loginModel));
  }

// changePassword(
//     BuildContext context, String currentPassword, String newPassword) async {
//   DialogUtils.showLoadingDialog(context, dismissable: false);
//   var body = {"currentPassword": currentPassword, "newPassword": newPassword};
//   Result result = await _userRepository.changePassword(body);
//   if (result.isSuccess()) {
//     dynamic errorResponse = result.getValue();
//     var message = errorResponse["message"];
//     successToast(message);
//     Navigator.of(context).pop();
//   } else {
//     errorToast(result.getErrorMsg()?.message ?? '');
//   }
//   Navigator.pop(context);
// }
//
  Future<Result> sendOTP(BuildContext context, String mobile) async {
    var body = {"countryCode": "977", "phone": mobile, "appId": "sdsddgd"};
    Result result = await _userRepository.sendOTP(body);
    if (result.isSuccess()) {
      dynamic errorResponse = result.getValue();
      var message = errorResponse["message"];
      successToast(message);
      return Result.success("Success");
    } else {
      errorToast(result.getErrorMsg()?.message ?? '');
      return Result.error(result.getErrorMsg()!);
    }
  }

  Future<Result> verifyOTP(
      BuildContext context, String mobile, String otp) async {
    var body = {"countryCode": "977", "phone": mobile, "otp": otp};
    Result result = await _userRepository.verifyOTP(body);
    if (result.isSuccess()) {
      dynamic errorResponse = result.getValue();
      var message = errorResponse["message"];
      successToast(message);
      return Result.success("Success");
    } else {
      errorToast(result.getErrorMsg()?.message ?? '');
      return Result.error(result.getErrorMsg()!);
    }
  }

  Future<Result> registerUser(Map<String, dynamic> body) async {
    Result result = await _userRepository.registerUser(body);
    if (result.isSuccess()) {
      dynamic errorResponse = result.getValue();
      var message = errorResponse["message"];
      successToast(message);
      return Result.success("Success");
    } else {
      errorToast(result.getErrorMsg()?.message ?? '');
      return Result.error(result.getErrorMsg()!);
    }
  }
  Future<Result> sendForgotPasswordOTP(
      BuildContext context, String mobileNumber) async {
    var body = {
      "countryCode": "977",
      "phone": mobileNumber,
      "appId": "sdsddgd"
    };
    Result result = await _userRepository.sendForgotPasswordOTP(body);
    if (result.isSuccess()) {
      dynamic data = result.getValue();
      var message = data["message"];
      successToast(message);
      return Result.success("Success");
    } else {
      errorToast(result.getErrorMsg()?.message ?? '');
      return Result.error(result.getErrorMsg()!);
    }
  }
  Future<Result> updateForgotPassword() async {
    var body = {
      "countryCode": "977",
      "phone": mobileNumber,
      "otp": otp,
      "password": password
    };
    Result result = await _userRepository.updateForgotPassword(body);
    if (result.isSuccess()) {
      var data = result.getValue();
      var message = data["message"];
      successToast(message);
      return Result.success("Success");
    } else {
      errorToast(result.getErrorMsg()?.message ?? "");
      return Result.error(result.getErrorMsg()!);
    }
  }

}
