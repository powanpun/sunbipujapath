import 'package:puja_path/api/api_client.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/shared_pref_wrapper/shared_pref_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AratiRepository {
  late ApiClient _apiClient;
  late SharedPrefWrapper _sharedPrefWrapper;

  AratiRepository() {
    _apiClient = ApiClient();
    _sharedPrefWrapper = SharedPrefWrapper(SharedPreferences.getInstance());
  }

  Future<Result> getAratiList(String token) async {
    Result result = await _apiClient.getAratiList(token);
    return result;
  }

}
