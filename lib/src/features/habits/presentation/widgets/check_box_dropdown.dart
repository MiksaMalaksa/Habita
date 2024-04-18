import 'package:flutter/material.dart';

class HabitaCheckBoxDropDown extends StatefulWidget {
  final List<String> entries;
  final void Function(String value) onChoosed;
  final Future Function() getInitial;
  final String initialValue;

  const HabitaCheckBoxDropDown({
    Key? key,
    required this.entries,
    required this.onChoosed,
    required this.getInitial,
    required this.initialValue,
  }) : super(key: key);

  @override
  State<HabitaCheckBoxDropDown> createState() => _DropDownState();
}

class _DropDownState<T> extends State<HabitaCheckBoxDropDown> {
  String? initial;
  late List<bool> checked = [];

  Future<void> setInitial() async {
    initial = await widget.getInitial();
    setState(() {});
  }

  @override
  void initState() {
    setInitial();
    checked = List<bool>.filled(widget.entries.length, true);
    super.initState();
  }

  void _setByIndex(int index) {
    setState(() {
      if (index == 0) {
        if (checked[0]) {
          checked[0] = false;
        } else {
          checked = checked.map((element) => false).toList();
          checked[0] = true;
        }

        initial = widget.entries[0];
      } else if (checked[index]) {
        checked[index] = false;
        initial = widget.entries[index];
      } else {
        checked[index] = true;
        if (!checked.contains(false)) {
          checked = checked.map((element) => false).toList();
          checked[0] = true;
          return;
        }
        checked[0] = false;
        if (checked[0] == false && !checked.sublist(1).contains(false)) {
          checked = checked.map((element) => false).toList();
          checked[0] = true;
          initial = widget.entries[0];
          return;
        }
        initial = widget.entries[index];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      requestFocusOnTap: false,
      initialSelection: initial ?? widget.initialValue,
      textStyle: Theme.of(context).dropdownMenuTheme.textStyle,
      menuStyle: Theme.of(context).dropdownMenuTheme.menuStyle,
      width: MediaQuery.of(context).size.width * 0.9,
      onSelected: (value) {
        final index = widget.entries.indexOf(value!);
        _setByIndex(index);
      },
      dropdownMenuEntries: widget.entries
          .asMap()
          .entries
          .map<DropdownMenuEntry<String>>((entry) {
        int index = entry.key;
        String value = entry.value;
        return DropdownMenuEntry(
          value: value,
          label: value.toString(),
          enabled: true,
          labelWidget: Row(
            children: [
              Checkbox(
                value: checked[index],
                onChanged: (bool? isChecked) {
                  if (isChecked != null) {
                    _setByIndex(index);
                  }
                },
              ),
              Text(value.toString()),
            ],
          ),
        );
      }).toList(),
    );
  }
}
