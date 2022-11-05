// Flutter imports:
import 'package:flutter/material.dart';

class ShimmerColors extends ThemeExtension<ShimmerColors> {
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerColors({
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  ShimmerColors copyWith({Color? baseColor, Color? highlightColor}) {
    return ShimmerColors(
      baseColor: baseColor ?? this.baseColor,
      highlightColor: highlightColor ?? this.highlightColor,
    );
  }

  @override
  ThemeExtension<ShimmerColors> lerp(
      ThemeExtension<ShimmerColors>? other, double t) {
    if (other is! ShimmerColors) {
      return this;
    }

    return ShimmerColors(
      baseColor: Color.lerp(baseColor, other.baseColor, t),
      highlightColor: Color.lerp(highlightColor, other.highlightColor, t),
    );
  }

  @override
  String toString() =>
      'ShimmerColors(baseColor: $baseColor, highlightColor: $highlightColor)';
}
