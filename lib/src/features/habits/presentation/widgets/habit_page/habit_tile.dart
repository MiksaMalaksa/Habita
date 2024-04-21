import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/container_button.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';



//!Нарисовать кастомный индикатор
class HabitTile extends StatelessWidget {
  final Habit habit;
  final bool active;
  const HabitTile({
    super.key,
    required this.habit,
    this.active = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ContainerButton(
        icon: habit.icon,
        iconColor: Colors.white,
        backcolor: habit.color,
        onPressed: () {},
      ),
      title: Text(
        habit.name,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.06),
      ),
      //!Заглушка
      trailing: active
          ? const Icon(
              Icons.circle_outlined,
              color: Colors.white,
            )
          : null,
      subtitle: habit.description == null
          ? null
          : Text(
              habit.description!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    color: Theme.of(context).primaryColorLight,
                  ),
            ),
    );
  }
}
