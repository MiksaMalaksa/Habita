import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:habita/core/common/widgets/date_picker_configes.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/habits/presentation/widgets/create_program/date_row/circular_container.dart';
import 'package:intl/intl.dart';

class DatePickerRow extends StatelessWidget {
  final String startDate;
  final String endDate;
  final HabitState state;
  const DatePickerRow({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.state,
  });

  //!Make 2 seperate methods because of if check,
  //!Do not want to make complex check with large amount of if statements
  Future<void> _chooseStartDate(
    BuildContext context, {
    required String message,
  }) async {
    final config = getStartConfig(context);
    await showCalendarDatePicker2Dialog(
      context: context,
      config: config,
      dialogSize: Size(MediaQuery.of(context).size.width * 0.84,
          MediaQuery.of(context).size.height * 0.48),
      borderRadius: BorderRadius.circular(15),
      value: [
        DateTime.now(),
      ],
      dialogBackgroundColor: Colors.white,
    ).then((value) {
      if (value != null) {
        if (value[0]!.isBefore(DateTime.now())) {
          showSnackBar(context: context, content: message);
        } else {
          final dateToString = DateFormat.yMd().format(value[0]!);
          context
              .read<HabitBloc>()
              .add(HabitProgramChange(programStart: dateToString));
        }
      }
    });
  }

  Future<void> _chooseEndDate(
    BuildContext context, {
    required String message,
  }) async {
    final config = getEndConfig(context);
    await showCalendarDatePicker2Dialog(
      context: context,
      config: config,
      dialogSize: Size(MediaQuery.of(context).size.width * 0.84,
          MediaQuery.of(context).size.height * 0.48),
      borderRadius: BorderRadius.circular(15),
      value: [
        DateTime.now().add(const Duration(days: minProgramDuration)),
      ],
      dialogBackgroundColor: Colors.white,
    ).then((value) {
      if (value != null) {
        if (value[0]!.isBefore(
            DateTime.now().add(const Duration(days: minProgramDuration - 1)))) {
          showSnackBar(context: context, content: message);
        } else {
          final dateToString = DateFormat.yMd().format(value[0]!);
          context
              .read<HabitBloc>()
              .add(HabitProgramChange(programEnd: dateToString));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * 0.12;
    final iconContainerHeight = containerHeight / 1.3;
    DateFormat formatter = DateFormat('M/d/yyyy');
    DateTime currentStart = formatter.parse(
      state.program.programStart,
    );
    DateTime currentEnd = formatter.parse(state.program.programEnd);
    bool correctEndDate = currentEnd.isAfter(
        currentStart.add(const Duration(days: minProgramDuration - 1)));

    return Row(
      children: [
        Flexible(
            flex: 1,
            child: _CalendarIconGecture(
              containerHeight: containerHeight,
              icon: FontAwesome5.calendar_day,
              description: S.of(context).startDate,
              iconContainerHeight: iconContainerHeight,
              dateLabel: startDate,
              textColor: const Color.fromARGB(255, 114, 219, 117),
              onPressed: () => _chooseStartDate(
                context,
                message: S.of(context).invalidStartDate,
              ),
            )),
        Flexible(
            flex: 1,
            child: _CalendarIconGecture(
              containerHeight: containerHeight,
              icon: FontAwesome5.calendar_check,
              description: S.of(context).endDate,
              iconContainerHeight: iconContainerHeight,
              dateLabel: endDate,
              textColor: correctEndDate
                  ? const Color.fromARGB(255, 114, 219, 117)
                  : const Color.fromARGB(255, 219, 118, 114),
              onPressed: () => _chooseEndDate(
                context,
                message: S.of(context).invalidEndDate,
              ),
            )),
      ],
    );
  }
}

class _CalendarIconGecture extends StatelessWidget {
  final VoidCallback onPressed;
  final double containerHeight;
  final double iconContainerHeight;
  final IconData icon;
  final String dateLabel;
  final String description;
  final Color textColor;

  const _CalendarIconGecture({
    required this.onPressed,
    required this.containerHeight,
    required this.iconContainerHeight,
    required this.dateLabel,
    required this.icon,
    required this.description,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: containerHeight,
        child: Row(
          children: [
            CircularContainer(
              iconContainerHeight: iconContainerHeight,
              icon: icon,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color:
                            Theme.of(context).primaryColorLight.desaturate(0.9),
                      ),
                ),
                Text(
                  dateLabel,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: textColor,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
