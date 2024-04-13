import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class DateContainer extends StatelessWidget {
  final String weekDay;
  final int dateNumber;
  final bool selected;
  const DateContainer({
    super.key,
    required this.weekDay,
    required this.dateNumber,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final background = selected
        ? Theme.of(context).primaryColorLight.withAlpha(150).withOpacity(0.4)
        : Theme.of(context).primaryColorLight.withAlpha(10);
    final borderRadius = selected ? 0.15 : 0.0;
    final borderColor = selected
        ? Theme.of(context).primaryColorLight
        : Colors.transparent;
    final textColor = selected
        ? Theme.of(context).primaryColorLight
        : Theme.of(context).primaryColorLight.withOpacity(0.7).desaturate(0.2);
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {},
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
                      .copyWith(color: textColor),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  dateNumber.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
