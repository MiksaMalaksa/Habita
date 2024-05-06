import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/presentation/widgets/container_icon.dart';

class HabitinfoScreen extends StatelessWidget {
  final Habit habit;
  const HabitinfoScreen({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Theme.of(context).primaryColorLight.desaturate(0.9),
        );
    return Scaffold(
      appBar: HabitaAppBar(title: habit.name),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: ContainerShowCase(
                containerSize: MediaQuery.of(context).size.width * 0.3,
                icon: habit.icon,
                backcolor: habit.color,
                iconColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            habit.description != null
                ? Column(
                    children: [
                      Text(
                        S.of(context).description,
                        style: textTheme,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        habit.description!,
                        style: textTheme,
                      ),
                    ],
                  )
                : const SizedBox()
          ]),
        ),
      ),
    );
  }
}
