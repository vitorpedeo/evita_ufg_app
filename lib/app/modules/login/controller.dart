// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/auth.dart';
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/modules/login/repository.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class LoginController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  final LoginRepository _repository = LoginRepository();

  RxBool isLoading = false.obs;

  Future<void> handleLogin(Map<String, dynamic> data) async {
    try {
      isLoading(true);

      AuthModel auth = await _repository.postLogin(data);
      await _storageService.setUser(auth.user);
      await _storageService.setToken(auth.token);
      await _storageService.setAuthenticated(true);

      CustomSnack.show(
        message: 'Bem vindo!',
        type: CustomSnackType.success,
      );

      Get.offAllNamed('/home');
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      isLoading(false);
    }
  }
}
