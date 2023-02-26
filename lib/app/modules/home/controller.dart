// Package imports:
import 'package:evita_ufg_app/app/data/services/auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/department.dart';
import 'package:evita_ufg_app/app/modules/home/repository.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  RxBool isLoadingDepartments = false.obs;
  RxBool isError = false.obs;
  List<DepartmentModel> allDepartments = <DepartmentModel>[];
  RxList<DepartmentModel> filteredDepartments = <DepartmentModel>[].obs;

  Rx<String?> departmentName = Rx<String?>(null);
  RxList<String> regionalValues = <String>[].obs;
  RxString selectedRegional = 'Todas'.obs;

  @override
  void onInit() async {
    super.onInit();

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

      isError(false);
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );

      isError(true);
    } finally {
      isLoadingDepartments(false);
    }
  }

  String formatAccountCreationDate(String? isoDate) {
    if (isoDate == null) {
      return '---';
    }

    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final DateTime parsedDate = DateTime.parse(isoDate);

    return formatter.format(parsedDate);
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
      if (await AuthService.instance.logout()) {
        CustomSnack.show(
          message: 'Até mais!',
          type: CustomSnackType.success,
        );

        Get.offAllNamed('/login');
      }
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    }
  }
}
