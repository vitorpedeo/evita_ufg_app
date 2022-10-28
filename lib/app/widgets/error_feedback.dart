// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/app_button.dart';
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class ErrorFeedback extends StatelessWidget {
  final String? title;
  final String? description;
  final void Function() onRetry;

  const ErrorFeedback({
    super.key,
    this.title,
    this.description,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: CustomTheme.redColor, width: 4),
            ),
            child: const Center(
              child: Icon(
                Icons.close,
                color: CustomTheme.redColor,
                size: 32,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          HeadingText(
            title ?? 'Falha ao carregar os dados',
            fontSize: 20,
            color: CustomTheme.redColor,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          BodyText(
            description ??
                'Não foi possível carregar os dados no momento. Certifique-se que está conectado à internet e tente novamente.',
            height: 1.5,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32,
          ),
          AppButton(
            'Tentar novamente',
            color: CustomTheme.redColor,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
