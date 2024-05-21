import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';

class SelectItem<T> {
  SelectItem(this.label, this.value);

  final String label;
  final T value;
}

class MsjDropdown<T> extends StatelessWidget {
  const MsjDropdown({
    super.key,
    required this.label,
    required this.items,
    this.value,
    required this.onChanged,
  });

  final String label;
  final List<SelectItem<T>> items;
  final T? value;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.gray200,
        borderRadius: BorderRadius.circular(100),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          items: items.map((SelectItem<T> item) {
            return DropdownMenuItem<T>(
              value: item.value,
              child: Text(item.label),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
