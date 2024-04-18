import 'package:flutter/material.dart';

class HabitaDropDown<T> extends StatefulWidget {
  final List<T> entries;
  final Map<Locale, Widget>? icons;
  final void Function(String value) onChoosed;
  final Future<T> Function() getInitial;
  final T initialValue;
  const HabitaDropDown({
    super.key,
    required this.entries,
    required this.onChoosed,
    required this.getInitial,
    this.icons,
    required this.initialValue,
  });

  @override
  State<HabitaDropDown<T>> createState() => _DropDownState<T>();
}

class _DropDownState<T> extends State<HabitaDropDown<T>> {
  T? initial;

  Future<void> setInitial() async {
    initial = await widget.getInitial();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setInitial();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
        initialSelection: initial ?? widget.initialValue,
        textStyle: Theme.of(context).dropdownMenuTheme.textStyle,
        menuStyle: Theme.of(context).dropdownMenuTheme.menuStyle,
        width: MediaQuery.of(context).size.width * 0.9,
        onSelected: (T? value) {
          if (value != null) {
            setState(() {
              widget.onChoosed(value.toString());
            });
          }
        },
        dropdownMenuEntries: widget.entries.map<DropdownMenuEntry<T>>((value) {
          return DropdownMenuEntry(
            style: Theme.of(context).menuButtonTheme.style,
            value: value,
            leadingIcon: widget.icons == null ? null : widget.icons![value],
            label: value.toString(),
            labelWidget: Text(
              value.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }).toList());
  }
}
