// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/teachers/controller.dart';

class TeachersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachersController>(
      () => TeachersController(),
    );
  }
}
