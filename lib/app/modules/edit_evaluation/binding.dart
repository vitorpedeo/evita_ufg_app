// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/edit_evaluation/controller.dart';

class EditEvaluationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEvaluationController>(
      () => EditEvaluationController(),
    );
  }
}
