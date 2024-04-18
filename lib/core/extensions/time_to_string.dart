import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

extension TimeExtension on Time {
  String timeToString(BuildContext context) {
    final timeOfDay = TimeOfDay(hour: hour, minute: minute);
    return timeOfDay.format(context);
  }
}
