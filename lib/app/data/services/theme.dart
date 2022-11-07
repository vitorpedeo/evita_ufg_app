// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class ThemeService extends GetxService {
  RxBool isDarkMode = false.obs;

  Future<ThemeService> init() async {
    isDarkMode.value =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;

    return this;
  }

  void changeThemeMode() {
    if (isDarkMode.value) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }

    isDarkMode.value = !isDarkMode.value;
  }
}
