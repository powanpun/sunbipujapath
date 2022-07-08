import 'package:get/get.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/model/home_banner_model.dart';
import 'package:puja_path/repository/home_repository.dart';
import 'package:puja_path/repository/user_repository.dart';
import 'package:puja_path/utils/toast.dart';

class HomeGetxController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();
  final UserRepository _userRepository = UserRepository();

  HomeBannerModel? homeBannerModel;

  void fetch() {
    getHomeBanner();
  }

  getHomeBanner() async {
    String token = await _userRepository.getAuthTokenFromPref();
    Result result = await _homeRepository.getHomeBanner(token);
    if (result.isSuccess()) {
      dynamic response = result.getValue();
      if (response is Map<String, dynamic>) {
        homeBannerModel = HomeBannerModel.fromJson(response);
        update();
      }
    } else {
      errorToast(result.getErrorMsg()?.message ?? '');
    }
  }
}
