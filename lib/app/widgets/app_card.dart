// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class AppCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget subtitle;
  final void Function() onTap;

  const AppCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        splashColor: CustomTheme.accentColor,
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          width: MediaQuery.of(context).size.width,
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
                child: Center(
                  child: icon,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(
                      title,
                      fontSize: 12,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    subtitle,
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
