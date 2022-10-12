// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final void Function() onPressed;
  final void Function()? onLongPress;
  final void Function(bool)? onHighlightChanged;
  final bool isLoading;
  final MouseCursor? mouseCursor;
  final ButtonTextTheme? textTheme;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? color;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Brightness? colorBrightness;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final EdgeInsetsGeometry? padding;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Duration? animationDuration;
  final double? minWidth;
  final double? height;
  final bool? enableFeedback;

  const AppButton(
    this.label, {
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.isLoading = false,
    this.mouseCursor,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.visualDensity,
    this.shape,
    this.clipBehavior,
    this.focusNode,
    this.autofocus,
    this.animationDuration,
    this.minWidth,
    this.height,
    this.enableFeedback,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth ?? MediaQuery.of(context).size.width,
      height: height ?? 40,
      color: color ?? CustomTheme.primaryColor,
      highlightColor: highlightColor ?? CustomTheme.accentColor,
      onPressed: isLoading ? null : onPressed,
      onLongPress: isLoading ? null : onLongPress,
      onHighlightChanged: onHighlightChanged,
      mouseCursor: mouseCursor,
      textTheme: textTheme,
      disabledTextColor: disabledTextColor,
      disabledColor: disabledColor ?? CustomTheme.primaryColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      colorBrightness: colorBrightness,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      padding: padding,
      visualDensity: visualDensity,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
      clipBehavior: clipBehavior ?? Clip.none,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback ?? true,
      child: isLoading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: FittedBox(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            )
          : BodyText(
              label ?? '',
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
    );
  }
}
