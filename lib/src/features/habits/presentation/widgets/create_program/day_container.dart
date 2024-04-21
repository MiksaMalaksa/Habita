import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class DayContainer extends StatelessWidget {
  final String centerText;
  final bool turned;
  final int index;
  final void Function(int choosed) onTapped;

  final double size;
  const DayContainer({
    super.key,
    required this.centerText,
    required this.size,
    required this.onTapped,
    required this.turned,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final background = turned
        ? Theme.of(context).primaryColorLight.withAlpha(150).withOpacity(0.4)
        : Theme.of(context).primaryColorLight.withAlpha(10);
    final borderRadius = turned ? 0.6 : 0.0;
    final borderColor =
        turned ? Theme.of(context).primaryColorLight : Colors.transparent;
    final textColor = turned
        ? Theme.of(context).primaryColorLight
        : Theme.of(context).primaryColorLight.withOpacity(0.9).desaturate(0.9);
    return GestureDetector(
      onTap: () => onTapped(index),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: background,
          border: Border.all(
            width: borderRadius,
            color: borderColor,
          ),
        ),
        child: Center(
          child: Text(
            centerText,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
