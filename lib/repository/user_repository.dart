import 'package:puja_path/api/api_client.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/shared_pref_wrapper/shared_pref_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  late ApiClient _apiClient;
  late SharedPrefWrapper _sharedPrefWrapper;

  UserRepository() {
    _apiClient = ApiClient();
    _sharedPrefWrapper = SharedPrefWrapper(SharedPreferences.getInstance());
  }

  Future<Result> userLogin(Map<String, dynamic> body) async {
    Result result = await _apiClient.loginUser(body);
    return result;
  }

  Future<Result> changePassword(Map<String, dynamic> body, String token) async {
    Result result = await _apiClient.updatePassword(body, token);
    return result;
  }

  Future<Result> sendOTP(Map<String, dynamic> body) async {
    Result result = await _apiClient.sendOTP(body);
    return result;
  }

  Future<Result> verifyOTP(Map<String, dynamic> body) async {
    Result result = await _apiClient.verifyOTP(body);
    return result;
  }

  Future<Result> registerUser(Map<String, dynamic> body) async {
    Result result = await _apiClient.registerUser(body);
    return result;
  }

  Future<Result> updateProfile(dynamic body, String token) async {
    Result result = await _apiClient.updateProfile(body, token);
    return result;
  }

  Future<Result> sendForgotPasswordOTP(Map<String, String> body) async =>
      await _apiClient.sendForgotPasswordOTP(body);

  Future<Result> updateForgotPassword(Map<String, dynamic> body) async =>
      await _apiClient.updateForgotPassword(body);

  void putAuthTokenToPref(String token) => _sharedPrefWrapper.putString(
        PREF_AUTH_TOKEN,
        token,
      );

  Future<String> getAuthTokenFromPref() => _sharedPrefWrapper.getString(
        PREF_AUTH_TOKEN,
        "",
      );

  void putLoginModelToPref(String loginModel) => _sharedPrefWrapper.putString(
        PREF_USER_DETAIL,
        loginModel,
      );

  Future<String> getLoginModelFromPref() =>
      _sharedPrefWrapper.getString(PREF_USER_DETAIL, "");

// Future<Result> logout() async => await _apiClient.logout();

// Future<String> getFCMFromPref() {
//   return _sharedPrefWrapper.getString(PREF_FCM_TOKEN, "");
// }
//
// void putFcmToPref(String token){
//   _sharedPrefWrapper.putString(PREF_FCM_TOKEN, token);
// }
}
