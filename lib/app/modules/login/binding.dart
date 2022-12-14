// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/login/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
