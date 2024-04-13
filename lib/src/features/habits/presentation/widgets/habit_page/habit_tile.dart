import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/container_button.dart';

//!Нарисовать кастомный индикатор
class HabitTile extends StatelessWidget {
  final IconData icon;
  final Color backColor;
  const HabitTile({
    super.key,
    required this.icon,
    required this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ContainerButton(
        icon: icon,
        iconColor: Colors.white,
        backcolor: backColor,
        onPressed: () {},
      ),
      title: Text(
        'Sleep',
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.06),
      ),
      subtitle: Text(
        'Sleep at least 7 hours',
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              color: Theme.of(context).primaryColorLight,
            ),
      ),
    );
  }
}
