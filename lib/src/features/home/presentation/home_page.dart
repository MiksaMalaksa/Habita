import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/widgets/heat_map.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/page_manager.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/home/presentation/widgets/stats_row.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/profile_picture.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          '${context.read<AuthBloc>().state.user!.name}👋',
                          style: Theme.of(context).textTheme.displayMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => context
                          .findAncestorStateOfType<PageManagerState>()!
                          .switchPage(3),
                      child: ProfilePicture(
                        size: MediaQuery.of(context).size.height * 0.09,
                        showBorder: false,
                        image: context.read<AuthBloc>().state.user?.imagePath ==
                                null
                            ? null
                            : File(context
                                .read<AuthBloc>()
                                .state
                                .user!
                                .imagePath!),
                      ),
                    ),
                  ],
                ),
                context.read<HabitBloc>().state.program.name.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                            ),
                            Text(
                              S.of(context).noHabitsForNow,
                              style: Theme.of(context).textTheme.headlineLarge,
                            )
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const StatsRow(),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: HabitaHeatMap(
                              dataSets: _dataSet(
                                  context.read<HabitBloc>().state.program),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Map<DateTime, int> _dataSet(HabitProgram program) {
  final allDays = DateTime.now()
      .add(const Duration(days: 1))
      .difference(DateFormat(dateFormat).parse(program.programStart))
      .inDays;
  final set = <DateTime, int>{};

  for (int i = 0; i < allDays; i++) {
    DateTime thatDay = DateFormat(dateFormat)
        .parse(program.programStart)
        .add(Duration(days: i));

    final habitDay = program.habitDays[i];

    final completedTasks =
        habitDay.habits.where((habit) => habit.isCompleted).length;

    set[thatDay] = ((completedTasks / habitDay.habits.length) * 10).ceil();
  }

  return set;
}
