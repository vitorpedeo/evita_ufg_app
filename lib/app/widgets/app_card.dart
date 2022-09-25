// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: CustomTheme.accentColor,
        onTap: () {},
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          width: Get.width,
          height: 80,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(236, 242, 247, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomTheme.accentColor,
                ),
                child: const Center(
                  child: Icon(
                    Icons.menu_book,
                    size: 24,
                    color: CustomTheme.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    HeadingText(
                      'CENTRO DE ENSINO E PESQUISA APLICADA A EDUCACAO',
                      fontSize: 12,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    BodyText(
                      'Goiânia',
                      fontSize: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
