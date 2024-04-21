import 'package:flutter/material.dart';

class HabitaDropDown<T> extends StatelessWidget {
  final List<T> entries;
  final Map<Locale, Widget>? icons;
  final void Function(String value) onChoosed;
  final T initialValue;
  const HabitaDropDown({
    super.key,
    required this.entries,
    required this.onChoosed,
    required this.initialValue,
    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
        initialSelection: initialValue,
        textStyle: Theme.of(context).dropdownMenuTheme.textStyle,
        menuStyle: Theme.of(context).dropdownMenuTheme.menuStyle,
        width: MediaQuery.of(context).size.width * 0.9,
        onSelected: (T? value) {
          if (value != null) {
            onChoosed(value.toString());
          }
        },
        dropdownMenuEntries: entries.map<DropdownMenuEntry<T>>((value) {
          return DropdownMenuEntry(
            style: Theme.of(context).menuButtonTheme.style,
            value: value,
            leadingIcon: icons == null ? null : icons![value],
            label: value.toString(),
            labelWidget: Text(
              value.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }).toList());
  }
}
