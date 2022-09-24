import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString title = 'Login'.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(
      seconds: 2,
    )).then((_) {
      title.value = 'Login Page';
    });
  }
}
