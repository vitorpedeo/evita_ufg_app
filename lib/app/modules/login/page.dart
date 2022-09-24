import 'package:evita_ufg_app/app/modules/login/widgets/google_login_button.dart';
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/modules/login/controller.dart';

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
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(
              parent: NeverScrollableScrollPhysics(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 88,
                  height: 88,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      'assets/images/evita_logo.svg',
                      semanticsLabel: 'Logo do Evita UFG',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: const HeadingText(
                          'Login',
                        ),
                      ),
                      const BodyText(
                        'Fuja dos professores ruins nesse semestre',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const TextInput(
                  label: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextInput(
                  label: 'Senha',
                ),
                const SizedBox(
                  height: 32,
                ),
                AppButton(
                  'Entrar',
                  onPressed: () {},
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      BodyText('ou'),
                      SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                ),
                const GoogleLoginButton(),
                const SizedBox(
                  height: 24,
                ),
                const BodyText(
                  'Não tem uma conta?',
                  color: CustomTheme.tertiaryTextColor,
                ),
                TextButton(
                  onPressed: () {},
                  child: const BodyText(
                    'Crie agora',
                    color: CustomTheme.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
