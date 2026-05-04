import 'package:flutter/material.dart';
import '../../core/constants.dart';

class ActionSelector extends StatelessWidget {
  final TextAction selected;
  final ValueChanged<TextAction> onChanged;

  const ActionSelector({super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: TextAction.values.map((action) {
        return ChoiceChip(
          label: Text(action.label),
          selected: selected == action,
          onSelected: (_) => onChanged(action),
        );
      }).toList(),
    );
  }
}
