// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/create_account/repository.dart';
import 'package:evita_ufg_app/core/utils/custom_snack.dart';

class CreateAccountController extends GetxController {
  final CreateAccountRepository _repository = CreateAccountRepository();

  RxBool isLoading = false.obs;

  Future<void> handleNewAccount(Map<String, dynamic> data) async {
    try {
      isLoading(true);

      await _repository.postNewAccount(data);

      CustomSnack.show(
        message: 'Conta criada com sucesso!',
        type: CustomSnackType.success,
      );

      Get.offAllNamed('/login');
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
