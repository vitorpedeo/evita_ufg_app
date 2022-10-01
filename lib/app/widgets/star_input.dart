// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class StarInput extends StatelessWidget {
  final double initialValue;
  final void Function(double) onChanged;

  const StarInput(
      {super.key, required this.initialValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BodyText(
              'Nota',
              color: CustomTheme.tertiaryTextColor,
            ),
            const SizedBox(
              height: 8,
            ),
            RatingBar(
              initialRating: initialValue,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              glow: false,
              itemPadding: const EdgeInsets.only(
                right: 2,
              ),
              ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: CustomTheme.yellowColor,
                ),
                half: const Icon(
                  Icons.star_half,
                  color: CustomTheme.yellowColor,
                ),
                empty: const Icon(
                  Icons.star_border,
                  color: CustomTheme.yellowColor,
                ),
              ),
              onRatingUpdate: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}
