// Package imports:
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

  Rx<String?> teacherName = Rx<String?>(null);
  Rx<String?> departmentName = Rx<String?>(null);

  @override
  Future<void> onReady() async {
    super.onReady();

    await getTeachers();
  }

  Future<void> getTeachers() async {
    try {
      isLoadingTeachers(true);

      int departmentId = int.parse(Get.arguments['departmentId']);
      List<TeacherModel> teachers =
          await _teachersRepository.getTeacherByDepartmentId(
        departmentId,
      );

      allTeachers.value = teachers;
      filteredTeachers.value = teachers;
      departmentName.value = Get.arguments['departmentName'];

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
            (teacher) => teacher.name!
                .toLowerCase()
                .contains(teacherName.value!.toLowerCase()),
          )
          .toList();
    }
  }
}
