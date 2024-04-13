enum HabitType {
  timer,
  multiple,
  todo,
  steps,
  notes,
  water,
}

HabitType toHabitType(String type) {
  switch (type) {
    case 'timer':
      return HabitType.timer;
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
}
