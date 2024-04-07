import 'package:flutter/material.dart';

class CustomizationDropDown<T> extends StatefulWidget {
  final List<T> entries;
  final Map<String, Widget>? icons;
  final void Function(String value) onChoosed;
  final Future<T> Function() getInitial;
  const CustomizationDropDown({
    super.key,
    required this.entries,
    required this.onChoosed,
    required this.getInitial,
    this.icons,
  });

  @override
  State<CustomizationDropDown<T>> createState() => _DropDownState<T>();
}

class _DropDownState<T> extends State<CustomizationDropDown<T>> {
  late T initial = widget.entries.first;

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
        initialSelection: initial,
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
          );
        }).toList());
  }
}
