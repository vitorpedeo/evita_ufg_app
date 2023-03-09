// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/modules/teacher/repository.dart';
import 'package:evita_ufg_app/app/modules/teachers/controller.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class TeacherController extends GetxController {
  final TeachersController _teachersController = Get.find<TeachersController>();
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

  Future<void> deleteComment(CommentModel comment) async {
    try {
      await _teacherRepository.deleteComment(comment.id!);

      // Update local values and rating/evaluations on Firestore
      if (teacher.value?.comments != null) {
        teacher.value!.comments!.remove(comment);

        int totalEvaluations = 0;
        double totalRating = 0;
        double rating = 0;

        if (teacher.value!.comments!.isNotEmpty) {
          totalEvaluations = teacher.value!.comments!.length;
          totalRating = teacher.value!.comments!
              .map((CommentModel comment) => comment.rating!)
              .reduce((double value, double element) => value + element);
          rating = totalRating / totalEvaluations;
        }

        teacher.update((value) {
          value!.rating = rating;
          value.evaluations = totalEvaluations;
        });

        final int allTeacherIndex = _teachersController.allTeachers.indexWhere(
          (allTeacher) => allTeacher.id == teacher.value!.id,
        );

        _teachersController.allTeachers[allTeacherIndex].evaluations =
            totalEvaluations;
        _teachersController.allTeachers[allTeacherIndex].rating = rating;
        _teachersController.allTeachers.refresh();

        await _teacherRepository.updateTeacherEvaluation({
          'evaluations': totalEvaluations,
          'rating': rating,
          'teacher': teacher.value!.id,
        });
      }

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
