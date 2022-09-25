// Package imports:
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> selectValues = ['Goiânia', 'Goiás', 'Aparecida de Goiânia'];
  String? selectedValue;

  void updateSelectedValue(String? value) {
    selectedValue = value;
    update();
  }
}
