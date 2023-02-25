// Package imports:
import 'package:evita_ufg_app/app/data/services/auth.dart';
import 'package:evita_ufg_app/routes/routes.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> handleLogin(Map<String, dynamic> data) async {
    try {
      isLoading(true);

      if (await AuthService.instance.login(data)) {
        CustomSnack.show(
          message: 'Bem vindo!',
          type: CustomSnackType.success,
        );

        Get.offAllNamed(Routes.home);
      }
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> handleGoogleLogin() async {
    try {
      if (await AuthService.instance.googleLogin()) {
        CustomSnack.show(
          message: 'Bem vindo!',
          type: CustomSnackType.success,
        );

        Get.offAllNamed(Routes.home);
      }
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      //
    }
  }
}
