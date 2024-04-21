import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/habits/presentation/widgets/create_program/day_container.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/habit_tile.dart';

class ListHabitBuilder extends StatefulWidget {
  final List<String> translatedDays;
  const ListHabitBuilder({super.key, required this.translatedDays});

  @override
  State<ListHabitBuilder> createState() => _ListHabitBuilderState();
}

class _ListHabitBuilderState extends State<ListHabitBuilder> {
  int _choosedDay = 0;
  late List<bool> turned = List.filled(widget.translatedDays.length, false);

  @override
  void initState() {
    turned[0] = true;
    super.initState();
  }

  void _setTheDay(int day) {
    setState(() {
      turned[_choosedDay] = false;
      turned[day] = true;
      _choosedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final rowSize = MediaQuery.of(context).size.width * 0.18;
    final habitViewSize = MediaQuery.of(context).size.height * 0.4;
    final program = context.read<HabitBloc>().state.program;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          height: rowSize,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.translatedDays.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: DayContainer(
                turned: turned[index],
                centerText: widget.translatedDays[index],
                size: rowSize,
                index: index,
                onTapped: (choosedDay) {
                  _setTheDay(choosedDay);
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: habitViewSize,
          width: double.infinity,
          child: program.habitDays[_choosedDay].habits.isEmpty
              ? Center(
                  child: Text(
                    S.of(context).noHabitsThisDay,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Theme.of(context).primaryColorLight),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: ListView.builder(
                    itemCount: program.habitDays[_choosedDay].habits.length,
                    itemBuilder: (context, index) {
                      Habit currentHabit =
                          program.habitDays[_choosedDay].habits[index];
                      return HabitTile(
                        active: false,
                        habit: currentHabit,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
