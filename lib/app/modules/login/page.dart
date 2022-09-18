import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:evita_ufg_app/app/modules/login/controller..dart';

class LoginPage extends StatelessWidget {
  final _controller = Get.find<LoginController>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Obx(
                  () => Text(
                    _controller.title.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
