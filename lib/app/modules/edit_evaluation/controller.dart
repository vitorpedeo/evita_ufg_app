// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/modules/edit_evaluation/repository.dart';
import 'package:evita_ufg_app/app/modules/teacher/controller.dart';
import 'package:evita_ufg_app/app/modules/teachers/controller.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class EditEvaluationController extends GetxController {
  final TeacherController _teacherController = Get.find<TeacherController>();
  final TeachersController _teachersController = Get.find<TeachersController>();
  final EditEvaluationRepository _repository = EditEvaluationRepository();

  RxBool isLoadingEvaluationEdit = false.obs;

  TeacherModel? teacher;
  CommentModel? comment;

  @override
  void onInit() {
    super.onInit();

    setContentToBeEdited();
  }

  void setContentToBeEdited() {
    teacher = Get.arguments['teacher'];
    comment = Get.arguments['comment'];
  }

  Future<void> handleEvaluationEdit(Map<String, dynamic> data) async {
    if (comment == null) {
      CustomSnack.show(
        message: 'Falha ao ler a avaliação.',
        type: CustomSnackType.error,
      );

      return;
    }

    try {
      isLoadingEvaluationEdit(true);

      await _repository.editEvaluation(comment!.id!, data);

      // Update local values and rating/evaluations on Firestore
      if (_teacherController.teacher.value?.comments != null) {
        final int allCommentsIndex = _teacherController.teacher.value!.comments!
            .indexWhere((existingComment) => existingComment.id == comment?.id);

        _teacherController.teacher.value!.comments![allCommentsIndex].rating =
            data['rating'];
        _teacherController.teacher.value!.comments![allCommentsIndex].content =
            data['content'];

        final int totalEvaluations =
            _teacherController.teacher.value!.comments!.length;
        final double totalRating = _teacherController.teacher.value!.comments!
            .map((CommentModel comment) => comment.rating!)
            .reduce((double value, double element) => value + element);
        final double rating = totalRating / totalEvaluations;

        _teacherController.teacher.update((value) {
          value!.rating = rating;
          value.evaluations = totalEvaluations;
        });

        final int allTeacherIndex = _teachersController.allTeachers.indexWhere(
          (allTeacher) => allTeacher.id == teacher?.id,
        );

        _teachersController.allTeachers[allTeacherIndex].evaluations =
            totalEvaluations;
        _teachersController.allTeachers[allTeacherIndex].rating = rating;
        _teachersController.allTeachers.refresh();

        await _repository.updateTeacherEvaluation({
          'evaluations': totalEvaluations,
          'rating': rating,
          'teacher': teacher?.id,
        });
      }

      CustomSnack.show(
        message: 'Avaliação editada com sucesso!',
        type: CustomSnackType.success,
      );

      Get.until((route) => Get.currentRoute == '/teacher');
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      isLoadingEvaluationEdit(false);
    }
  }
}
