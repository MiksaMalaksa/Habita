import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class DateContainer extends StatelessWidget {
  final String weekDay;
  final DateTime dateNumber;
  final bool selected;
  final void Function(DateTime) onChoosed;
  const DateContainer({
    super.key,
    required this.weekDay,
    required this.dateNumber,
    required this.selected,
    required this.onChoosed,
  });

  @override
  Widget build(BuildContext context) {
    final background = selected
        ? Theme.of(context).primaryColorLight.withAlpha(150).withOpacity(0.4)
        : Theme.of(context).primaryColorLight.withAlpha(10);
    final borderRadius = selected ? 0.15 : 0.0;
    final borderColor =
        selected ? Theme.of(context).primaryColorLight : Colors.transparent;
    final textColor = selected
        ? Colors.white
        : Theme.of(context).primaryColorLight.withOpacity(0.9).desaturate(0.9);
    final weight = selected ? FontWeight.bold : FontWeight.normal;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () => onChoosed(dateNumber),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.155,
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                width: borderRadius,
                color: borderColor,
              )),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  weekDay,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: textColor, fontWeight: weight),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  dateNumber.day.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: textColor, fontWeight: weight),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
