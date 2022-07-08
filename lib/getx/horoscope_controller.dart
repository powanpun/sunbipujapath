import 'package:get/get.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/model/horoscope_model.dart';
import 'package:puja_path/repository/horoscope_repository.dart';
import 'package:puja_path/repository/user_repository.dart';
import 'package:puja_path/utils/toast.dart';

class HoroscopeController extends GetxController {
  final HoroscopeRepository _horoscopeRepository = HoroscopeRepository();
  final UserRepository _userRepository = UserRepository();

  HoroscopeModel? horoscopeModel;

  getHoroscope() async {
    String token = await _userRepository.getAuthTokenFromPref();
    Result result = await _horoscopeRepository.getHoroscope(token);
    if (result.isSuccess()) {
      dynamic response = result.getValue();
      if (response is Map<String, dynamic>) {
        horoscopeModel = HoroscopeModel.fromJson(response);
        update();
      }
    } else {
      errorToast(result.getErrorMsg()?.message ?? '');
    }
  }
}
