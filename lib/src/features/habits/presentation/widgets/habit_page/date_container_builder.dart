import 'package:flutter/material.dart';
import 'package:habita/core/constants/localised_days.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/date_container.dart';

class DateBuilder extends StatelessWidget {
  final void Function(int, DateTime) onChoosedDate;
  final int selectedIndex;
  const DateBuilder({
    super.key,
    required this.onChoosedDate,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final translatedWeekDays = LocalisedDays.localisedMedium(context);
    final currentWeekDay = DateTime.now().weekday;
    final displayedDays = translatedWeekDays.sublist(currentWeekDay - 1);
    if (currentWeekDay != 1) {
      displayedDays.addAll(translatedWeekDays.sublist(0, currentWeekDay - 1));
    }
    final dayOrders = List.generate(displayedDays.length,
        (index) => DateTime.now().add(Duration(days: index)));
    final selections =
        List.generate(dayOrders.length, (index) => index == selectedIndex);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.086,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dayOrders.length,
        itemBuilder: (context, index) => DateContainer(
          weekDay: translatedWeekDays[index],
          dateNumber: dayOrders[index],
          selected: selections[index],
          onChoosed: (selected) {
            final indexOfDate =
                dayOrders.indexWhere((element) => element.day == selected.day);
            onChoosedDate(indexOfDate, selected);
          },
        ),
      ),
    );
  }
}
