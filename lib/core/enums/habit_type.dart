import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';

enum HabitType {
  multiple,
  todo,
  steps,
  notes,
  water,
}

class HabitTypeConverter {
  static HabitType toHabitType(String type) {
    switch (type) {
      case 'multiple':
        return HabitType.multiple;
      case 'todo':
        return HabitType.todo;
      case 'steps':
        return HabitType.steps;
      case 'notes':
        return HabitType.notes;
      case 'water':
        return HabitType.water;
      default:
        return HabitType.notes;
    }
  }

  static List<String> translatedList(BuildContext context) {
    return [
      S.of(context).notes,
      S.of(context).multiple,
      S.of(context).todo,
      S.of(context).steps,
      S.of(context).water
    ];
  }
}

HabitType toHabitType(String type) {
  switch (type) {
    case 'multiple':
      return HabitType.multiple;
    case 'todo':
      return HabitType.todo;
    case 'steps':
      return HabitType.steps;
    case 'notes':
      return HabitType.notes;
    case 'water':
      return HabitType.water;
    default:
      return HabitType.notes;
  }
}

extension HabitTypeExtension on HabitType {
  String toShortString() {
    return toString().split('.').last;
  }

  List<HabitType> allTypes() {
    return HabitType.values.toList();
  }
}
