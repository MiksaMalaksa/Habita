import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/habit_tile.dart';
import 'package:intl/intl.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HabitinfoScreen extends StatelessWidget {
  final Habit habit;
  const HabitinfoScreen({super.key, required this.habit});

  (int, int, int) _countStats(int currentDay, HabitProgram program) {
    final days = program.habitDays;
    int streak = 0;
    int completed = 0;
    int failed = 0;
    for (int i = currentDay; i >= 0; --i) {
      int habitIndex = days[i].habits.indexWhere((e) => e.id == habit.id);
      if (habitIndex != -1) {
        if (days[i].habits[habitIndex].isCompleted) {
          streak++;
        } else {
          break;
        }
      }
    }

    for (int i = 0; i <= currentDay; ++i) {
      int habitIndex = days[i].habits.indexWhere((e) => e.id == habit.id);
      if (habitIndex != -1) {
        if (days[i].habits[habitIndex].isCompleted) {
          completed++;
        } else {
          failed++;
        }
      }
    }

    return (streak, completed, failed);
  }

  @override
  Widget build(BuildContext context) {
    final currentProgram = context.read<HabitBloc>().state.program;
    final mainTextTheme = Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context).primaryColor.desaturate(0.9),
          fontWeight: FontWeight.bold,
        );
    //!calculating streak
    final diffrenceInDays = DateTime.now()
        .difference(DateFormat(dateFormat)
            .parse(context.read<HabitBloc>().state.program.programStart))
        .inDays;

    final doneAndTarget = HabitTypeConverter.targetAndCurrent(habit);
    final stats = _countStats(diffrenceInDays, currentProgram);
    return Scaffold(
      appBar: HabitaAppBar(title: habit.name),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).progressToday,
                  style: mainTextTheme,
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.07),
                  child: _ProgressBar(
                    current: doneAndTarget.$1,
                    target: doneAndTarget.$2,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  S.of(context).generalStatistic,
                  style: mainTextTheme,
                ),
                const SizedBox(
                  height: 20,
                ),
                //!Streak
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: RadialGradient(
                      colors: [
                        Theme.of(context)
                            .primaryColorLight
                            .withAlpha(200)
                            .withOpacity(0.7),
                        Theme.of(context)
                            .primaryColorDark
                            .withOpacity(0.8)
                            .desaturate(0.1),
                      ],
                      center: const Alignment(-0.8, -0.3),
                      radius: 1.6,
                    ),
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      bottom: 16,
                      right: 8,
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              S.of(context).streak,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              //!Streak
                              '${stats.$1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/streak.png',
                          height: MediaQuery.of(context).size.height * 0.1,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //!Success
                HabitTile(
                  tapable: false,
                  habit: habit.copyWith(
                    description: S.of(context).completed,
                    color: const Color.fromARGB(255, 138, 224, 140),
                  ),
                  trail: Text('${stats.$2}'),
                ),
                const SizedBox(
                  height: 15,
                ),
                //!Success
                HabitTile(
                  tapable: false,
                  habit: habit.copyWith(
                    description: S.of(context).failed,
                    color: const Color.fromARGB(255, 218, 107, 107),
                  ),
                  trail: Text('${stats.$3}'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int target;
  final int current;
  const _ProgressBar({required this.target, required this.current});

  @override
  Widget build(BuildContext context) {
    return SimpleCircularProgressBar(
      size: MediaQuery.of(context).size.height * 0.2,
      fullProgressColor:
          Theme.of(context).primaryColor.desaturate(0.2).withOpacity(0.7),
      progressStrokeWidth: 10,
      backStrokeWidth: 10,
      mergeMode: true,
      maxValue: target.toDouble(),
      onGetText: (_) {
        return Text(
          '$current / $target',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).primaryColorLight.desaturate(0.9),
              ),
        );
      },
      progressColors: [
        Theme.of(context).primaryColorLight,
        Theme.of(context).primaryColor
      ],
      backColor: Theme.of(context).dialogBackgroundColor,
    );
  }
}
