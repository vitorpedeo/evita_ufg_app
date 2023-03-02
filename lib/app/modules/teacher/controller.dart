// Package imports:
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/modules/teacher/repository.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class TeacherController extends GetxController {
  final TeacherRepository _teacherRepository = TeacherRepository();

  final String teacherId = Get.arguments['teacherId'] as String;

  RxBool isLoadingTeacher = false.obs;
  RxBool isError = false.obs;
  Rx<TeacherModel?> teacher = Rx<TeacherModel?>(null);

  @override
  Future<void> onInit() async {
    super.onInit();

    await getTeacher();
  }

  Future<void> getTeacher() async {
    try {
      isLoadingTeacher.value = true;

      teacher.value = await _teacherRepository.getTeacher(teacherId);
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      isLoadingTeacher.value = false;
    }
  }

  Future<void> deleteComment(int id) async {
    try {
      await _teacherRepository.deleteComment(id);

      CustomSnack.show(
        message: 'Comentário deletado com sucesso!',
        type: CustomSnackType.success,
      );
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    }
  }
}
