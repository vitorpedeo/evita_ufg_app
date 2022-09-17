import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    count++;
  }
}
