// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/app_card.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/app/widgets/text_input.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.keyboard_backspace_outlined,
                      size: 24,
                    ),
                    label: const BodyText(
                      'Voltar',
                      color: CustomTheme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 32,
                ),
                child: const HeadingText(
                  'Professores',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 24,
                ),
                child: const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: CustomTheme.secondaryTextColor,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'O instituto ',
                      ),
                      TextSpan(
                        text: 'ESCOLA DE AGRONOMIA',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: ' possui ',
                      ),
                      TextSpan(
                        text: '80 professores.',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: const [
                  Expanded(
                    child: TextInput(
                      hintText: 'Nome',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                  ),
                  child: ListView.separated(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return AppCard(
                        icon: const HeadingText(
                          'A',
                          color: CustomTheme.primaryColor,
                          fontSize: 20,
                        ),
                        title: 'ALISSON NEVES HARMYANS MOREIRA',
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: CustomTheme.yellowColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                                children: [
                                  TextSpan(
                                    text: '4,5 ',
                                    style: TextStyle(
                                      color: CustomTheme.primaryTextColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '(21)',
                                    style: TextStyle(
                                      color: CustomTheme.secondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Get.toNamed('/teacher');
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12,
                      );
                    },
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
