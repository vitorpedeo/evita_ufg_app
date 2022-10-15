// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/modules/home/repository.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class HomeController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  final HomeRepository _homeRepository = HomeRepository();

  List<String> selectValues = ['Goiânia', 'Goiás', 'Aparecida de Goiânia'];
  String? selectedValue;

  void updateSelectedValue(String? value) {
    selectedValue = value;
    update();
  }

  Future<void> logout() async {
    try {
      await _homeRepository.getInvalidateToken();

      await _storageService.clear();

      CustomSnack.show(
        message: 'Até mais!',
        type: CustomSnackType.success,
      );

      Get.offAllNamed('/login');
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    }
  }
}
