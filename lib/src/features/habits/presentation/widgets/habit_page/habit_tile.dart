import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/widgets/circular_progress.dart';
import 'package:habita/core/common/widgets/container_button.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/extensions/substruct_dates.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:intl/intl.dart';

class HabitTile extends StatefulWidget {
  final Habit habit;
  final int? indexInList;
  final bool? tapable;
  final VoidCallback? onPressed;
  final Widget? trail;
  const HabitTile({
    super.key,
    required this.habit,
    this.indexInList,
    this.trail,
    this.tapable = true,
    this.onPressed,
  });

  @override
  HabitTileState createState() => HabitTileState();
}

class HabitTileState extends State<HabitTile> {
  late final ValueNotifier<double> _progressNotifier;

  @override
  void initState() {
    super.initState();
    final startValue = widget.habit.completedSteps == null
        ? 0
        : widget.habit.completedSteps!.toDouble();
    _progressNotifier = ValueNotifier<double>(startValue.toDouble());
  }

  @override
  void dispose() {
    _progressNotifier.dispose();
    super.dispose();
  }

  void _onTap(BuildContext context) {
    final currentProgram = context.read<HabitBloc>().state.program;
    final currentDay = DateFormat(dateFormat).format(DateTime.now());
    final dayIndex = currentDay.dateDifference(currentProgram.programStart);
    if (_progressNotifier.value < widget.habit.taskSteps!) {
      _progressNotifier.value = _progressNotifier.value + 1;
      context.read<HabitBloc>().add(
            ChangeHabitStats(
              completedSteps: _progressNotifier.value.toInt(),
              dayIndex: dayIndex,
              habitId: widget.indexInList,
            ),
          );
    } else {
      showSnackBar(context: context, content: S.of(context).toMuch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tapable == false
          ? () {}
          : () =>
              showSnackBar(context: context, content: S.of(context).iconTap),
      child: ListTile(
        leading: ContainerButton(
          icon: widget.habit.icon,
          iconColor: Colors.white,
          backcolor: widget.habit.color,
          onPressed: widget.tapable! && widget.onPressed != null
              ? widget.onPressed!
              : () {},
        ),
        title: Text(
          widget.habit.name,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.06),
        ),
        trailing: widget.trail ??
            ((widget.habit.habitType == HabitType.multiple ||
                        widget.habit.habitType == HabitType.todo) &&
                    widget.tapable == true
                ? GestureDetector(
                    onTap: () => _onTap(context),
                    child: HabitaCircularIndicator(
                      textStyle: Theme.of(context).textTheme.titleSmall!,
                      notifier: _progressNotifier,
                      maxValue: widget.habit.taskSteps!.toDouble(),
                      width: MediaQuery.of(context).size.height * 0.006,
                      size: MediaQuery.of(context).size.height * 0.05,
                    ))
                : widget.tapable == false ? null : 
                _WateStepsTrail(
                    habit: widget.habit,
                  )),
        subtitle: widget.habit.description == null
            ? null
            : Text(
                widget.habit.description!,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Theme.of(context).primaryColorLight,
                    ),
              ),
      ),
    );
  }
}

class _WateStepsTrail extends StatelessWidget {
  final Habit habit;
  const _WateStepsTrail({required this.habit});

  @override
  Widget build(BuildContext context) {
    final completed = habit.habitType == HabitType.water
        ? habit.waterConsumed
        : habit.stepsProduced;
    final aim = habit.habitType == HabitType.water
        ? habit.waterTarget
        : habit.stepsTarget;
    return Text('$completed/$aim',style: Theme.of(context).textTheme.headlineSmall,);
  }
}
