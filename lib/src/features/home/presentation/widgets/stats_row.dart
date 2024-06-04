import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:intl/intl.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final program = context.read<HabitBloc>().state.program;
    final labels = [
      S.of(context).remain,
      S.of(context).completed,
      S.of(context).failed,
      S.of(context).doneToday,
    ];
    const colors = [
      Color.fromARGB(255, 212, 218, 107),
      Color.fromARGB(255, 218, 107, 107),
      Color.fromARGB(255, 218, 107, 159),
      Color.fromARGB(255, 218, 107, 216),
    ];

    final allDays = DateTime.now()
        .difference(DateFormat(dateFormat).parse(program.programStart))
        .inDays;
    final remain = DateFormat(dateFormat)
        .parse(program.programEnd)
        .difference(DateTime.now())
        .inDays;
    final failed = program.habitDays.take(allDays + 1).fold(
          0,
          (outerPreviousValue, habitDay) => habitDay.habits.fold(
            true,
            (innerPreviousValue, habit) =>
                habit.isCompleted ? innerPreviousValue : false,
          )
              ? outerPreviousValue
              : outerPreviousValue + 1,
        );
    final completed = program.habitDays.take(allDays + 1).fold(
          0,
          (outerPreviousValue, habitDay) => habitDay.habits.fold(
            true,
            (innerPreviousValue, habit) =>
                habit.isCompleted ? innerPreviousValue : false,
          )
              ? outerPreviousValue + 1
              : outerPreviousValue,
        );
    final doneToday = program.habitDays[allDays].habits.fold(
      0,
      (previousValue, element) =>
          element.isCompleted ? ++previousValue : previousValue,
    );
    final stats = [remain, completed, failed, doneToday];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            labels.length,
            (index) => _InfoTile(colors[index], labels[index], stats[index]),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final Color color;
  final String label;
  final int stat;

  const _InfoTile(this.color, this.label, this.stat);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: color,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                label,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              stat.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
