import 'package:get/get.dart';

import 'package:evita_ufg_app/app/modules/create_account/controller.dart';

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountController());
  }
}
