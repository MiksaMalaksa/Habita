import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/src/themes/bloc/theme_bloc.dart';

dynamic showDayNightPicker(BuildContext context, void Function(Time) onChange) {
  final currentMode = context.read<ThemeBloc>().state.currentMode;
  final textTheme = Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: Theme.of(context).primaryColorLight.desaturate(0.9),
      );
   showPicker(
    context: context,
    value: Time.fromTimeOfDay(
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
      null,
    ),
    cancelStyle: textTheme.copyWith(
      color: Theme.of(context).primaryColorDark,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
    okStyle: textTheme.copyWith(
      color: Theme.of(context).primaryColorDark,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
    accentColor: currentMode == ThemeMode.dark
        ? Theme.of(context).primaryColor
        : Theme.of(context).primaryColorLight,
    onChange: onChange,
  );
}
