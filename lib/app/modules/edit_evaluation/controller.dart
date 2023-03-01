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
    try {
      isLoadingEvaluationEdit(true);

      await _repository.patchEditEvaluation(
        int.parse(comment!.id!),
        data,
      );

      CustomSnack.show(
        message: 'Avaliação editada com sucesso!',
        type: CustomSnackType.success,
      );

      _teachersController.getTeachers();

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
