import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HabitaHeatMap extends StatelessWidget {
  final Map<DateTime, int> dataSets;
  const HabitaHeatMap({super.key, required this.dataSets});

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    final lastDay = DateTime(currentYear, currentMonth + 1, 0).day;
    return HeatMap(
      defaultColor: Theme.of(context).primaryColorLight.withOpacity(0.1),
      size: 30,
  
      
      colorMode: ColorMode.color,
      startDate: DateTime(DateTime.now().year, currentMonth, 5),
      endDate: DateTime(DateTime.now().year, currentMonth, lastDay),
      datasets: dataSets,
      textColor: Theme.of(context).textTheme.labelSmall!.color,
      showColorTip: false,
      colorsets: {
        1: Theme.of(context).primaryColor.withAlpha(60),
        3: Theme.of(context).primaryColor.withAlpha(90),
        6: Theme.of(context).primaryColor.withAlpha(120),
        8: Theme.of(context).primaryColor.withAlpha(150),
        11: Theme.of(context).primaryColor,
      },
    );
  }
}
