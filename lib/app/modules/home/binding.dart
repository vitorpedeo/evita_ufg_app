// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
