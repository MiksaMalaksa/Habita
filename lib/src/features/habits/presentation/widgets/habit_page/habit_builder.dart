import 'package:flutter/material.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/habit_tile.dart';
import 'package:intl/intl.dart';

class HabitBuilder extends StatelessWidget {
  final HabitProgram program;
  final DateTime day;
  const HabitBuilder({
    super.key,
    required this.program,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final diffrenceInDays = day
        .difference(DateFormat(dateFormat).parse(program.programStart))
        .inDays;

    return diffrenceInDays < 0
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
                child: Text(
              'Program will start in ${-diffrenceInDays} days!',
              style: Theme.of(context).textTheme.headlineSmall,
            )),
          )
        : program.programLength() < diffrenceInDays
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                    child: Text(
                  '🎉Program ended! Congrats!🎉',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: program.habitDays.isEmpty
                    ? Center(
                        child: Text(
                          S.of(context).noHabitsThisDay,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColorLight),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                        child: ListView.builder(
                          itemCount:
                              program.habitDays[diffrenceInDays].habits.length,
                          itemBuilder: (context, index) {
                            bool noHabits = program
                                .habitDays[diffrenceInDays].habits.isEmpty;
                            Habit currentHabit = program
                                .habitDays[diffrenceInDays].habits[index];
                            return noHabits
                                ? Center(
                                    child: Text(
                                    'No habits this day!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ))
                                : HabitTile(
                                    active: false,
                                    habit: currentHabit,
                                  );
                          },
                        ),
                      ),
              );
  }
}
