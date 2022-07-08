import 'package:dio/dio.dart';
import 'package:puja_path/api/api_constants.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/utils/api_error_constants.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    _dio = getApiClient();
  }

  Future<Result> loginUser(Map<String, dynamic> body) async {
    try {
      print("URL : $LOGIN");
      var result = await _dio.post(LOGIN, data: body);
      return Result.success(result.data);
    } catch (error) {
      print("URL : ${error.toString()}");
      return Result.error(_getErrorData(error));
    }
  }

  Future<Result> updatePassword(Map<String, dynamic> body,String token) async {
    try {
      _dio.options.headers["Authorization"] = "Bearer $token";
      var result = await _dio.post(UPDATE_PASSWORD, data: body);
      return Result.success(result.data);
    } catch (error) {
      return Result.error(_getErrorData(error));
    }
  }

  Future<Result> updateProfile(dynamic body, String token) async {
    try {
      _dio.options.headers["Authorization"] = "Bearer $token";
      var result = await _dio.post(UPDATE_PROFILE, data: body);
      return Result.success(result.data);
    } catch (error) {
      return Result.error(_getErrorData(error));
    }
  }

  Future<Result> getHomeBanner(String token) async {
    try {
      _dio.options.headers["Authorization"] = "Bearer $token";
      var result = await _dio.get(
        HOME_BANNER,
      );
      return Result.success(result.data);
    } catch (error) {
      return Result.error(_getErrorData(error));
    }
  }

  Future<Result> getHoroscope(String token) async {
    try {
      _dio.options.headers["Authorization"] = "Bearer $token";
      var result = await _dio.get(
        HOROSCOPE_LIST,
      );
      print(result.data);
      return Result.success(result.data);
    } catch (error) {
      return Result.error(_getErrorData(error));
    }
  }

  Future<Result> getAratiList(String token) async {
    try {
      _dio.options.headers["Authorization"] = "Bearer $token";
      var result = await _dio.get(
        ARATI_LIST,
      );
      print(result.data);
      return Result.success(result.data);
    } catch (error) {
      return Result.error(_getErrorData(error));
    }
  }

  Future<Result> sendOTP(Map<String, dynamic> body) async {
    try {
      var result = await _dio.post(SEND_OTP, data: body);
      return Result.success(result.data);
    } catch (error) {
      return Result.error(_getErrorData(error));
    }
  }

  Future<Result> verifyOTP(Map<String, dynamic> body) async {
    try {
      var result = await _dio.post(VERIFY_OTP, data: body);
      return Result.success(result.data);
    } catch (error) {
      return Result.error(_getErrorData(error));
    }
  }

  Future<Result> registerUser(Map<String, dynamic> body) async {
    try {
      var result = await _dio.post(REGISTER_USER, data: body);
      return Result.success(result.data);
    } catch (error) {
      return Result.error(_getErrorData(error));
    }
  }

  DataError _getErrorData(error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = APIErrorConstants.DIO_ERROR_CANCEL;
          break;
        case DioErrorType.connectTimeout:
          errorDescription = APIErrorConstants.DIO_ERROR_CONNECT_TIMEOUT;
          break;
        case DioErrorType.other:
          errorDescription = APIErrorConstants.DIO_ERROR_DEFAULT;
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = APIErrorConstants.DIO_ERROR_RECEIVE_TIMEOUT;
          break;
        case DioErrorType.response:
          if (dioError.response != null) {
            dynamic errorResponse = error.response;
            var message = errorResponse.data["message"] ??
                APIErrorConstants.UNEXPECTED_ERROR;
            errorDescription = message;
          } else
            errorDescription = dioError.message;
          break;
        case DioErrorType.sendTimeout:
          errorDescription = APIErrorConstants.DIO_ERROR_SEND_TIMEOUT;
          break;
      }
    } else {
      errorDescription = APIErrorConstants.UNEXPECTED_ERROR;
    }
    return DataError(errorDescription, error?.response?.statusCode ?? 0);
  }

  Dio getApiClient() {
    Dio _dio = new Dio();
    _dio.options = BaseOptions(connectTimeout: 15000, receiveTimeout: 15000);
    _dio.interceptors.clear();
    _dio.options.headers["content-type"] = "application/json";
    _dio.options.headers["accept"] = "application/json";
    /*final performanceInterceptor = DioFirebasePerformanceInterceptor();
    _dio.interceptors.add(performanceInterceptor);*/
    _dio.options.baseUrl = BASE_URL;
    // _dio.interceptors.add(
    //     InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
    //   return requestInterceptor(options);
    // }, onResponse: (Response response, handler) {
    //   return responseInterceptor(response); // continue
    // }, onError: (DioError error, handler) async {
    //   print(error.toString());
    //   return errorInterceptor(error);
    // }));
    return _dio;
  }

  dynamic responseInterceptor(Response response) {
    return response;
  }

  dynamic errorInterceptor(DioError dioError) {
    if (dioError.message.contains("ERROR_001")) {
      // this will push a new route and remove all the routes that were present
      return dioError;
    }

    return dioError;
  }

  dynamic requestInterceptor(RequestOptions options) async {
    if (options.headers.containsKey("requiresToken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");

      /*SharedPreferences prefs = await SharedPreferences.getInstance();
      var header = prefs.get("Header");

      options.headers.addAll({"Header": "$header${DateTime.now()}"});*/

      return options;
    }
  }

  Future<Result> sendForgotPasswordOTP(Map<String, dynamic> body) async {
    try {
      var result = await _dio.post(SEND_FORGOT_PASSWORD_OTP, data: body);
      return Result.success(result.data);
    } catch (error) {
      return Result.error(_getErrorData(error));
    }
  }

  Future<Result> updateForgotPassword(Map<String, dynamic> body) async {
    try {
      var result = await _dio.post(UPDATE_FORGOT_PASSWORD, data: body);
      return Result.success(result.data);
    } catch (e) {
      return Result.error(_getErrorData(e));
    }
  }


  // Future<Result> logout() async {
  //   try {
  //     var token = await PrefUtils.getString(ACCESS_TOKEN, "");
  //     _dio.options.headers["Authorization"] = "Bearer $token";
  //     var result = await _dio.post(LOGOUT);
  //     return Result.success(result.data);
  //   } catch (e) {
  //     return Result.error(_getErrorData(e));
  //   }
  // }

}
