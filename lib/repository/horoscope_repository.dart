import 'package:puja_path/api/api_client.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/shared_pref_wrapper/shared_pref_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HoroscopeRepository {
  late ApiClient _apiClient;
  late SharedPrefWrapper _sharedPrefWrapper;

  HoroscopeRepository() {
    _apiClient = ApiClient();
    _sharedPrefWrapper = SharedPrefWrapper(SharedPreferences.getInstance());
  }

  Future<Result> getHoroscope(String token) async {
    Result result = await _apiClient.getHoroscope(token);
    return result;
  }

}
