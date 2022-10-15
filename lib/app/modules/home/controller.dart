// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/department.dart';
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/modules/home/repository.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class HomeController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  final HomeRepository _homeRepository = HomeRepository();

  RxBool isLoadingDepartments = false.obs;
  List<DepartmentModel> allDepartments = <DepartmentModel>[];
  RxList<DepartmentModel> filteredDepartments = <DepartmentModel>[].obs;

  Rx<String?> departmentName = Rx<String?>(null);
  RxList<String> regionalValues = <String>[].obs;
  RxString selectedRegional = 'Todas'.obs;

  @override
  void onReady() async {
    super.onReady();

    await getAllDepartments();
  }

  Future<void> getAllDepartments() async {
    try {
      isLoadingDepartments(true);

      List<DepartmentModel> departments =
          await _homeRepository.getAllDepartments();

      allDepartments = departments;
      filteredDepartments.value = departments;

      regionalValues.value = departments
          .map((DepartmentModel department) => department.regional!)
          .toSet()
          .toList();
      regionalValues.insert(0, 'Todas');
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      isLoadingDepartments(false);
    }
  }

  void handleFilter() {
    if (selectedRegional.value != 'Todas') {
      if (departmentName.value == null || departmentName.value!.isEmpty) {
        filteredDepartments.value = allDepartments
            .where(
              (department) =>
                  department.regional!.toLowerCase() ==
                  selectedRegional.value.toLowerCase(),
            )
            .toList();
      } else {
        filteredDepartments.value = allDepartments
            .where(
              (department) =>
                  department.name!.toLowerCase().contains(
                        departmentName.value!.toLowerCase(),
                      ) &&
                  department.regional!.toLowerCase() ==
                      selectedRegional.value.toLowerCase(),
            )
            .toList();
      }
    } else {
      if (departmentName.value == null || departmentName.value!.isEmpty) {
        filteredDepartments.value = allDepartments;
      } else {
        filteredDepartments.value = allDepartments
            .where(
              (department) => department.name!.toLowerCase().contains(
                    departmentName.value!.toLowerCase(),
                  ),
            )
            .toList();
      }
    }
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
