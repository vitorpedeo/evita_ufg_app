// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class TextInput extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool? autofocus;
  final int? maxLines;
  final int? minLines;
  final bool? obscureText;
  final bool? expands;
  final bool? readOnly;
  final bool? showCursor;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final Brightness? keyboardAppearance;
  final GestureTapCallback? onTap;

  const TextInput(
      {super.key,
      this.label,
      this.controller,
      this.focusNode,
      this.decoration,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.errorText,
      this.keyboardType,
      this.textInputAction,
      this.textCapitalization,
      this.style,
      this.textAlign,
      this.textAlignVertical,
      this.textDirection,
      this.autofocus,
      this.maxLines,
      this.minLines,
      this.obscureText,
      this.expands,
      this.readOnly,
      this.showCursor,
      this.maxLength,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.onAppPrivateCommand,
      this.inputFormatters,
      this.enabled,
      this.keyboardAppearance,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return label != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(
                label!,
                color: CustomTheme.tertiaryTextColor,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: decoration ??
                    InputDecoration(
                      hintText: hintText,
                      prefixIcon: prefixIcon,
                      prefixIconColor: CustomTheme.secondaryTextColor,
                      suffixIcon: suffixIcon,
                      suffixIconColor: CustomTheme.secondaryTextColor,
                      errorText: errorText,
                      errorStyle: const TextStyle(
                        color: CustomTheme.redColor,
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomTheme.redColor,
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomTheme.redColor,
                        ),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      filled: true,
                      fillColor: const Color.fromRGBO(237, 242, 247, 1),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomTheme.primaryColor,
                        ),
                      ),
                    ),
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                style: style ??
                    const TextStyle(
                      color: CustomTheme.primaryTextColor,
                      fontSize: 14,
                    ),
                textAlign: textAlign ?? TextAlign.start,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                autofocus: autofocus ?? false,
                maxLines: maxLines ?? 1,
                minLines: minLines,
                obscureText: obscureText ?? false,
                expands: expands ?? false,
                readOnly: readOnly ?? false,
                showCursor: showCursor,
                maxLength: maxLength,
                onChanged: onChanged,
                onEditingComplete: onEditingComplete,
                onSubmitted: onSubmitted,
                onAppPrivateCommand: onAppPrivateCommand,
                inputFormatters: inputFormatters,
                enabled: enabled,
                keyboardAppearance: keyboardAppearance,
                onTap: onTap,
              ),
            ],
          )
        : TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: decoration ??
                InputDecoration(
                  hintText: hintText,
                  prefixIcon: prefixIcon,
                  prefixIconColor: CustomTheme.secondaryTextColor,
                  suffixIcon: suffixIcon,
                  suffixIconColor: CustomTheme.secondaryTextColor,
                  errorText: errorText,
                  errorStyle: const TextStyle(
                    color: CustomTheme.redColor,
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomTheme.redColor,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomTheme.redColor,
                    ),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  filled: true,
                  fillColor: const Color.fromRGBO(237, 242, 247, 1),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomTheme.primaryColor,
                    ),
                  ),
                ),
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            style: style ??
                const TextStyle(
                  color: CustomTheme.primaryTextColor,
                  fontSize: 14,
                ),
            textAlign: textAlign ?? TextAlign.start,
            textAlignVertical: textAlignVertical,
            textDirection: textDirection,
            autofocus: autofocus ?? false,
            maxLines: maxLines,
            minLines: minLines,
            obscureText: obscureText ?? false,
            expands: expands ?? false,
            readOnly: readOnly ?? false,
            showCursor: showCursor,
            maxLength: maxLength,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onSubmitted: onSubmitted,
            onAppPrivateCommand: onAppPrivateCommand,
            inputFormatters: inputFormatters,
            enabled: enabled,
            keyboardAppearance: keyboardAppearance,
            onTap: onTap,
          );
  }
}
