// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/create_account/repository.dart';

class CreateAccountController extends GetxController {
  final CreateAccountRepository _repository = CreateAccountRepository();

  RxBool isLoading = false.obs;

  Future<void> handleNewAccount(Map<String, dynamic> data) async {
    try {
      isLoading(true);

      await _repository.postNewAccount(data);
      Get.snackbar('Sucesso', 'Deu certo!');
    } catch (e) {
      Get.snackbar('Erro', 'Deu erro!');
    } finally {
      isLoading(false);
    }
  }
}
