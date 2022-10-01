// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/create_evaluation/controller.dart';

class CreateEvaluationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateEvaluationController>(
      () => CreateEvaluationController(),
    );
  }
}
