// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/teacher/controller.dart';

class TeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherController>(
      () => TeacherController(),
    );
  }
}
