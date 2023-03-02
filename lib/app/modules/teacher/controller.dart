// Package imports:
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/modules/teacher/repository.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class TeacherController extends GetxController {
  final TeacherRepository _teacherRepository = TeacherRepository();

  RxBool isLoadingTeacher = false.obs;
  RxBool isError = false.obs;
  Rx<TeacherModel?> teacher = Rx<TeacherModel?>(null);

  @override
  Future<void> onInit() async {
    super.onInit();

    teacher.value = Get.arguments['teacher'] as TeacherModel?;

    if (teacher.value != null) {
      getTeacherComments();
    }
  }

  Future<void> getTeacherComments() async {
    isLoadingTeacher.value = true;

    final List<CommentModel> comments =
        await _teacherRepository.getTeacherComments(teacher.value!.id!);

    teacher.update((val) {
      val?.comments = comments;
    });

    isLoadingTeacher.value = false;
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
