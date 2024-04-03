import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class CustomizationDropDown<T> extends StatefulWidget {
  final List<T> entries;
  final List<Widget>? icons;
  final void Function(String value) onChoosed;
  const CustomizationDropDown({
    super.key,
    required this.entries,
    required this.onChoosed,
    this.icons,
  });

  @override
  State<CustomizationDropDown<T>> createState() => _DropDownState<T>();
}

var ok = CountryFlag.fromCountryCode('cz') as Icon;

class _DropDownState<T> extends State<CustomizationDropDown<T>> {
  late T dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.entries.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
        initialSelection: widget.entries.first,
        textStyle: Theme.of(context).dropdownMenuTheme.textStyle,
        menuStyle: Theme.of(context).dropdownMenuTheme.menuStyle,
        width: MediaQuery.of(context).size.width * 0.9,
        onSelected: (T? value) {
          if (value != null) {
            setState(() {
              dropdownValue = value;
              widget.onChoosed(value.toString());
            });
          }
        },
        dropdownMenuEntries:
            widget.entries.asMap().entries.map<DropdownMenuEntry<T>>((entry) {
          int index = entry.key;
          T value = entry.value;
          return DropdownMenuEntry(
            style: Theme.of(context).menuButtonTheme.style,
            value: value,
            leadingIcon: widget.icons == null ? null : widget.icons![index],
            label: value.toString(),
          );
        }).toList());
  }
}
