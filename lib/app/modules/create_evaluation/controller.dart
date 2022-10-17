// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/modules/create_evaluation/repository.dart';
import 'package:evita_ufg_app/app/modules/teacher/controller.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class CreateEvaluationController extends GetxController {
  final TeacherController _teacherController = Get.find<TeacherController>();
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

      await _repository.postNewEvaluation(
        {
          ...data,
          'teacher_id': teacher?.id,
        },
      );

      CustomSnack.show(
        message: 'Avaliação salva com sucesso!',
        type: CustomSnackType.success,
      );

      Get.offAndToNamed('/teacher', arguments: {
        'teacherId': teacher?.id,
      });

      _teacherController.getTeacher();
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
