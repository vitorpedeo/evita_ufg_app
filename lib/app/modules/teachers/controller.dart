// Package imports:
import 'package:diacritic/diacritic.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/modules/teachers/repository.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class TeachersController extends GetxController {
  final TeachersRepository _teachersRepository = TeachersRepository();

  RxBool isLoadingTeachers = true.obs;
  RxBool isError = false.obs;
  RxList<TeacherModel> allTeachers = <TeacherModel>[].obs;
  RxList<TeacherModel> filteredTeachers = <TeacherModel>[].obs;

  final String departmentId = Get.arguments['departmentId'];
  final String departmentName = Get.arguments['departmentName'];

  Rx<String?> teacherName = Rx<String?>(null);

  @override
  Future<void> onInit() async {
    super.onInit();

    await getTeachers();
  }

  Future<void> getTeachers() async {
    try {
      isLoadingTeachers(true);

      List<TeacherModel> teachers =
          await _teachersRepository.getTeacherByDepartmentId(
        departmentId,
      );

      allTeachers.value = teachers;
      filteredTeachers.value = teachers;

      isError(false);
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );

      isError(true);
    } finally {
      isLoadingTeachers(false);
    }
  }

  void handleFilter() {
    if (teacherName.value == null || teacherName.value!.isEmpty) {
      filteredTeachers.value = allTeachers;
    } else {
      filteredTeachers.value = allTeachers
          .where(
            (teacher) => removeDiacritics(teacher.name!)
                .toLowerCase()
                .contains(removeDiacritics(teacherName.value!).toLowerCase()),
          )
          .toList();
    }
  }
}
