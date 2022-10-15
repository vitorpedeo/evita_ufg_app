// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/core/theme/custom.dart';

enum CustomSnackType {
  success,
  error,
}

class CustomSnack {
  static void show({required String message, required CustomSnackType type}) {
    bool isSuccess = type == CustomSnackType.success;

    Get.snackbar(
      isSuccess ? 'Sucesso' : 'Erro',
      message,
      margin: const EdgeInsets.all(
        12,
      ),
      padding: const EdgeInsets.all(
        12,
      ),
      borderRadius: 4,
      backgroundColor: isSuccess ? Colors.green.shade400 : CustomTheme.redColor,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      icon: Icon(
        isSuccess ? Icons.check : Icons.close,
        color: Colors.white,
      ),
      dismissDirection: DismissDirection.startToEnd,
    );
  }
}
