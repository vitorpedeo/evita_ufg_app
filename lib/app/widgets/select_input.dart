// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:evita_ufg_app/core/theme/custom.dart';

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
        decoration: const BoxDecoration(
          color: Color.fromRGBO(237, 242, 247, 1),
          borderRadius: BorderRadius.all(
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
          style: const TextStyle(
            color: CustomTheme.primaryTextColor,
            fontSize: 14,
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Color.fromRGBO(113, 128, 150, 1),
          ),
        ),
      ),
    );
  }
}
