// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/modules/teacher/repository.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class TeacherController extends GetxController {
  final TeacherRepository _teacherRepository = TeacherRepository();

  final teacherId = int.parse(Get.arguments['teacherId']);

  RxBool isLoadingTeacher = false.obs;
  Rx<TeacherModel?> teacher = Rx<TeacherModel?>(null);

  @override
  Future<void> onReady() async {
    super.onReady();

    await getTeacher();
  }

  Future<void> getTeacher() async {
    try {
      isLoadingTeacher(true);

      teacher.value = await _teacherRepository.getTeacherById(teacherId);
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      isLoadingTeacher(false);
    }
  }

  Future<void> deleteComment(int id) async {
    try {
      await _teacherRepository.deleteComment(id);

      CustomSnack.show(
        message: 'Comentário deletado com sucesso!',
        type: CustomSnackType.success,
      );

      getTeacher();
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    }
  }
}
