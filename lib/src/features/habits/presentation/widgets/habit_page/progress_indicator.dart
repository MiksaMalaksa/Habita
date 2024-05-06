import 'package:flutter/material.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:intl/intl.dart';

String _progressMessage(double progress, BuildContext context) {
  if (progress == 1.0) {
    return S.of(context).youDidIt;
  } else if (progress >= 0.8) {
    return S.of(context).almostDone;
  } else if (progress >= 0.5) {
    return S.of(context).halfDone;
  } else {
    return S.of(context).nothingDone;
  }
}

class HabitProgressContainer extends StatelessWidget {
  final bool display;
  final DateTime day;
  final HabitProgram program;

  const HabitProgressContainer({
    super.key,
    required this.display,
    required this.day,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    final diffrenceInDays = day
        .difference(DateFormat(dateFormat).parse(program.programStart))
        .inDays;
    bool noHabits = program.habitDays[diffrenceInDays].habits.isEmpty;
    final currentDay = program.habitDays[diffrenceInDays];
    final allHabitAmount = currentDay.habits.length;
    final allCompleted = List.from(currentDay.habits);
    allCompleted.removeWhere((habit) => habit.isCompleted == false);
    final amountOfCompleted = allCompleted.length;
    final message =
        _progressMessage(amountOfCompleted / allHabitAmount, context);

    return noHabits
        ? const SizedBox()
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: RadialGradient(
                colors: [
                  Theme.of(context)
                      .primaryColorLight
                      .withAlpha(200)
                      .withOpacity(0.7),
                  display
                      ? Theme.of(context)
                          .primaryColorDark
                          .withOpacity(0.8)
                          .desaturate(0.1)
                      : Colors.grey,
                ],
                center: const Alignment(-0.8, -0.3),
                radius: 1.6,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10,
              ),
              child: display
                  ? Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Image.asset(
                          'assets/dart.png',
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: MediaQuery.of(context).size.width * 0.22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.016,
                            top: MediaQuery.of(context).size.height * 0.016,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                    ),
                              ),
                              Text(
                                S.of(context).completedOutOf(
                                    amountOfCompleted, allHabitAmount),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: Colors.white
                                          .desaturate(0.8)
                                          .withOpacity(0.5),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                    ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: LinearProgressIndicator(
                                  minHeight:
                                      MediaQuery.of(context).size.height * 0.01,
                                  borderRadius: BorderRadius.circular(10),
                                  //!change
                                  value: amountOfCompleted / allHabitAmount,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context)
                                        .colorScheme
                                        .primaryContainer
                                        .desaturate(0.5)
                                        .withOpacity(0.7),
                                  ),
                                  backgroundColor:
                                      Theme.of(context).primaryColorLight,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.415,
                                  ),
                                  Text(
                                    '${(amountOfCompleted / allHabitAmount * 100).toStringAsFixed(1)}%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  : null,
            ),
          );
  }
}
