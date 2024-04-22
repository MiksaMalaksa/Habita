import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';

class HabitStats extends StatelessWidget {
  final Habit habit;
  const HabitStats({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HabitaAppBar(title: 'Habit view'),
      body: SafeArea(child: Center()),
    );
  }
}
