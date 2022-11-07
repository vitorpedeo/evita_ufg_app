// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class SelectInput<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) label;
  final T? selectedItem;
  final void Function(T?) onChanged;

  final String? hint;

  const SelectInput(
      {super.key,
      required this.items,
      required this.label,
      this.selectedItem,
      required this.onChanged,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        height: 50,
        decoration: BoxDecoration(
          color: context.theme.inputDecorationTheme.fillColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: DropdownButton<T>(
          value: selectedItem,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<T>>((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(label(item)),
            );
          }).toList(),
          isDense: true,
          isExpanded: true,
          hint: Text(hint ?? ''),
          dropdownColor: context.theme.backgroundColor,
          style: TextStyle(
            color: context.theme.textTheme.headline1?.color,
            fontSize: 14,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: context.theme.textTheme.bodyText1?.color,
          ),
        ),
      ),
    );
  }
}
