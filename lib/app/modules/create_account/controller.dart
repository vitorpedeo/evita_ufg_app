// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/auth.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';
import 'package:evita_ufg_app/routes/routes.dart';

class CreateAccountController extends GetxController {
  RxBool isLoading = false.obs;
  bool hasAcceptedTerms = false;

  Future<void> handleNewAccount(Map<String, dynamic> data) async {
    try {
      isLoading(true);

      if (await AuthService.instance.register(data)) {
        CustomSnack.show(
          message: 'Conta criada com sucesso!',
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
}
