import 'package:flutter/material.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/date_container.dart';

const weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const nums = [10, 11, 12, 13, 14, 15, 16];

class DateBuilder extends StatelessWidget {
  const DateBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.086,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        itemBuilder: (context, index) => DateContainer(
          weekDay: weekDays[index],
          dateNumber: nums[index],
          selected: false,
        ),
      ),
    );
  }
}
