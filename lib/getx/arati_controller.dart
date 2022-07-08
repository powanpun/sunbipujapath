import 'package:get/get.dart';
import 'package:puja_path/api/result.dart';
import 'package:puja_path/model/arati_model.dart';
import 'package:puja_path/repository/arati_repository.dart';
import 'package:puja_path/repository/user_repository.dart';
import 'package:puja_path/utils/toast.dart';

class AratiController extends GetxController {
  final AratiRepository _aratiRepository = AratiRepository();
  final UserRepository _userRepository = UserRepository();

  AratiModel? aratiModel;

  getAratiList() async {
    String token = await _userRepository.getAuthTokenFromPref();
    Result result = await _aratiRepository.getAratiList(token);
    if (result.isSuccess()) {
      dynamic response = result.getValue();
      if (response is Map<String, dynamic>) {
        aratiModel = AratiModel.fromJson(response);
        update();
      }
    } else {
      errorToast(result.getErrorMsg()?.message ?? '');
    }
  }
}
