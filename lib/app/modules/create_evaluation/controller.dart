// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/data/services/auth.dart';
import 'package:evita_ufg_app/app/modules/create_evaluation/repository.dart';
import 'package:evita_ufg_app/app/modules/teacher/controller.dart';
import 'package:evita_ufg_app/app/modules/teachers/controller.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class CreateEvaluationController extends GetxController {
  final AuthService _authService = AuthService.instance;
  final TeacherController _teacherController = Get.find<TeacherController>();
  final TeachersController _teachersController = Get.find<TeachersController>();
  final CreateEvaluationRepository _repository = CreateEvaluationRepository();

  RxBool isLoadingEvaluationCreation = false.obs;

  TeacherModel? teacher;

  @override
  void onInit() {
    super.onInit();

    setTeacherToBeEvaluated();
  }

  void setTeacherToBeEvaluated() {
    teacher = Get.arguments['teacher'];
  }

  Future<void> handleEvaluationCreation(Map<String, dynamic> data) async {
    try {
      isLoadingEvaluationCreation(true);

      final DocumentReference<Map<String, dynamic>> commentRef =
          await _repository.postNewComment(
        {
          ...data,
          'teacher': teacher?.id,
          'user': _authService.user.value?.id,
        },
      );

      final CommentModel createdComment =
          await _repository.getComment(commentRef);
      createdComment.user = _authService.user.value;

      // Update local values and rating/evaluations on Firestore
      if (_teacherController.teacher.value?.comments != null) {
        _teacherController.teacher.value!.comments!.add(createdComment);

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
        message: 'Avaliação salva com sucesso!',
        type: CustomSnackType.success,
      );

      Get.until((route) => Get.currentRoute == '/teacher');
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      isLoadingEvaluationCreation(false);
    }
  }
}
