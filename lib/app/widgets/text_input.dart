import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
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
                    const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 16, 10, 15),
                      filled: true,
                      fillColor: Color.fromRGBO(237, 242, 247, 1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
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
                    ),
                textAlign: textAlign ?? TextAlign.start,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                autofocus: autofocus ?? false,
                maxLines: maxLines,
                minLines: minLines,
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
                const InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(237, 242, 247, 1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
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
                ),
            textAlign: textAlign ?? TextAlign.start,
            textAlignVertical: textAlignVertical,
            textDirection: textDirection,
            autofocus: autofocus ?? false,
            maxLines: maxLines,
            minLines: minLines,
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
