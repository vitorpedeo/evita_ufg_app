// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/login/controller.dart';
import 'package:evita_ufg_app/app/modules/login/widgets/google_login_button.dart';
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final _controller = Get.find<LoginController>();

  LoginPage({super.key});

  Future<void> _handleFormSubmit() async {
    _formKey.currentState!.save();

    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> formData = _formKey.currentState!.value;

      await _controller.handleLogin(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = Get.mediaQuery.viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                !isKeyboardOpen
                    ? Column(
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
                        ],
                      )
                    : Container(),
                FormBuilder(
                  key: _formKey,
                  initialValue: const {
                    'email': '',
                    'password': '',
                  },
                  child: Column(
                    children: [
                      FormBuilderField<String>(
                        name: 'email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }

                          if (!GetUtils.isEmail(value)) {
                            return 'E-mail inválido';
                          }

                          return null;
                        },
                        builder: (field) {
                          return TextInput(
                            label: 'Email',
                            hintText: 'Digite seu email',
                            errorText: field.errorText,
                            onChanged: ((value) => field.didChange(value)),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderField<String>(
                          name: 'password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }

                            return null;
                          },
                          builder: (field) {
                            return TextInput(
                              label: 'Senha',
                              obscureText: true,
                              hintText: 'Digite sua senha',
                              errorText: field.errorText,
                              onChanged: ((value) => field.didChange(value)),
                            );
                          }),
                      const SizedBox(
                        height: 32,
                      ),
                      Obx(
                        () => AppButton(
                          'Entrar',
                          onPressed: _handleFormSubmit,
                          isLoading: _controller.isLoading.value,
                        ),
                      ),
                    ],
                  ),
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
                BodyText(
                  'Não tem uma conta?',
                  color: context.theme.textTheme.bodyText2?.color,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/create-account');
                  },
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
