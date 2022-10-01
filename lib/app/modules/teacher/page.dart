// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/modules/teacher/widgets/comment_card.dart';
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

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
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: CustomTheme.accentColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'A',
                          style: TextStyle(
                            color: CustomTheme.primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const HeadingText(
                      'ADAO WAGNER PEGO EVANGELISTA',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const BodyText(
                      'adao@ufg.br',
                      color: CustomTheme.primaryTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const BodyText(
                      'ESCOLA DE AGRONOMIA',
                      fontSize: 12,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: CustomTheme.yellowColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 14,
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
                                text: '(21 avaliações)',
                                style: TextStyle(
                                  color: CustomTheme.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const HeadingText(
                'Avaliações',
                fontSize: 14,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: ListView.separated(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return CommentCard(
                          id: index,
                          isFromLoggedUser: true,
                        );
                      }

                      return CommentCard(
                        id: index,
                        isFromLoggedUser: false,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  ),
                ),
              ),
              AppButton(
                'Avaliar',
                onPressed: () {
                  Get.toNamed('/create-evaluation');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
