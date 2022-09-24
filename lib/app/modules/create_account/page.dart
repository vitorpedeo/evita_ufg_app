import 'package:evita_ufg_app/app/modules/create_account/controller.dart';
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';

class CreateAccountPage extends StatelessWidget {
  final _controller = Get.find<CreateAccountController>();

  CreateAccountPage({super.key});

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
                  width: 80,
                  height: 80,
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
                          'Criar conta',
                        ),
                      ),
                      const BodyText(
                        'Descubra qual professor deve ser evitado',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const TextInput(
                  label: 'Nome',
                  hintText: 'Digite seu nome',
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextInput(
                  label: 'Email',
                  hintText: 'Digite seu email',
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextInput(
                  label: 'Senha',
                  obscureText: true,
                  hintText: 'Digite sua senha',
                ),
                const SizedBox(
                  height: 32,
                ),
                AppButton(
                  'Criar conta',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 24,
                ),
                const BodyText(
                  'Já tem uma conta?',
                  color: CustomTheme.tertiaryTextColor,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: const BodyText(
                    'Entre agora',
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
