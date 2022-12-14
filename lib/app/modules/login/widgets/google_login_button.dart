// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class GoogleLoginButton extends StatelessWidget {
  final void Function() onPressed;

  const GoogleLoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      height: 40,
      color: const Color.fromRGBO(66, 133, 244, 1),
      highlightColor: CustomTheme.accentColor,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: FittedBox(
              child: SvgPicture.asset(
                'assets/images/google_login_logo.svg',
                semanticsLabel: 'Logo do Google',
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const BodyText(
            'Entrar com o Google',
            color: Colors.white,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
