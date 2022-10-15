// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/user.dart';
import 'package:evita_ufg_app/app/data/services/storage.dart';

class HomeController extends GetxController {
  final StorageService _storageService = StorageService();

  RxBool isLoadingUser = false.obs;
  Rx<UserModel?> user = Rx<UserModel?>(null);

  List<String> selectValues = ['Goiânia', 'Goiás', 'Aparecida de Goiânia'];
  String? selectedValue;

  @override
  Future<void> onReady() async {
    super.onReady();

    await getUserFromStore();
  }

  void updateSelectedValue(String? value) {
    selectedValue = value;
    update();
  }

  Future<void> getUserFromStore() async {
    isLoadingUser(true);

    user.value = await _storageService.getUser();

    isLoadingUser(false);
  }
}
