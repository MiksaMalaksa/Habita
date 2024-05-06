import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:habita/generated/l10n.dart';

enum HabitType {
  multiple,
  todo,
  steps,
  water,
}

class HabitTypeConverter {
  static HabitType toHabitType(BuildContext context, String type) {
    if (S.of(context).todo == type) {
      return HabitType.todo;
    } else if (S.of(context).multiple == type) {
      return HabitType.multiple;
    } else if (S.of(context).steps == type) {
      return HabitType.steps;
    } else if (S.of(context).water == type) {
      return HabitType.water;
    } else {
      return HabitType.todo;
    }
  }

  static List<String> translatedList(BuildContext context) {
    return [
      S.of(context).todo,
      S.of(context).multiple,
      S.of(context).steps,
      S.of(context).water
    ];
  }

  static (IconData, String, int) fromTypeToColorIcon(
      BuildContext context, HabitType type) {
    final translated = translatedList(context);
    switch (type) {
      case HabitType.todo:
        return (FontAwesome5.check, translated[0], 1);
      case HabitType.multiple:
        return (FontAwesome5.tasks, translated[1], 20);
      case HabitType.steps:
        return (FontAwesome5.walking, translated[2], 50000);
      case HabitType.water:
        return (FontAwesome5.water, translated[3], 10000);
    }
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
    case 'water':
      return HabitType.water;
    default:
      return HabitType.todo;
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
