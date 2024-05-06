import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HabitaCircularIndicator extends StatelessWidget {

  final double maxValue;
  final double width;
  final TextStyle textStyle;
  final double size;
  final ValueNotifier<double> notifier;
  const HabitaCircularIndicator({
    super.key,
    required this.maxValue,
    required this.width,
    required this.size,
    required this.textStyle,
    required this.notifier,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleCircularProgressBar(
      size: size,
      animationDuration: 1,
      valueNotifier: notifier,
      fullProgressColor: Theme.of(context).primaryColor,
      progressStrokeWidth: width,
      backStrokeWidth: width,
      mergeMode: true,
      maxValue: maxValue,
      onGetText: (value) {
        return Text(
          '${value.toInt()}',
          style: textStyle,
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
