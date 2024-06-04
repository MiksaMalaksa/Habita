import 'package:flutter/material.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/presentation/screens/habit_info.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/habit_tile.dart';
import 'package:intl/intl.dart';

bool _compareDates(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

class HabitBuilder extends StatelessWidget {
  final DateTime day;
  final HabitProgram program;
  const HabitBuilder({super.key, required this.day, required this.program});

  @override
  Widget build(BuildContext context) {
    final diffrenceInDays = day
        .difference(DateFormat(dateFormat).parse(program.programStart))
        .inDays;
    final pickedToday = _compareDates(day, DateTime.now());
    bool noHabits = program.habitDays[diffrenceInDays].habits.isEmpty;
    return diffrenceInDays < 0
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
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
                height: MediaQuery.of(context).size.height * 0.4,
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
                        child: noHabits
                            ? Center(
                                child: Text(
                                'No habits this day!',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ))
                            : ListView.builder(
                              itemExtent: MediaQuery.of(context).size.height*0.07,
                                itemCount: program
                                    .habitDays[diffrenceInDays].habits.length,
                                itemBuilder: (context, index) {
                                  Habit currentHabit = program
                                      .habitDays[diffrenceInDays].habits[index];
                                  return HabitTile(
                                    onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => HabitinfoScreen(
                                            habit: currentHabit),
                                      ),
                                    ),
                                    tapable: pickedToday,
                                    indexInList: index,
                                    habit: currentHabit,
                                  );
                                },
                              ),
                      ),
              );
  }
}
