import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';

class SegmentedMutability extends StatelessWidget {
  final Set<bool> selections;
  const SegmentedMutability({super.key, required this.selections});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SegmentedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context)
                    .primaryColor
                    .withOpacity(0.9)
                    .withAlpha(150);
              } else {
                return Theme.of(context).scaffoldBackgroundColor;
              }
            },
          ),
        ),
        emptySelectionAllowed: false,
        multiSelectionEnabled: false,
        selectedIcon: null,
        segments: <ButtonSegment<bool>>[
          ButtonSegment<bool>(
            value: true,
            label: Text(S.of(context).mutable),
          ),
          ButtonSegment<bool>(
            value: false,
            label: Text(S.of(context).immutable),
          ),
        ],
        selected: selections,
        onSelectionChanged: (Set<bool> newSelection) {
          context
              .read<HabitBloc>()
              .add(HabitProgramChanging(muatable: newSelection.first));
        },
        showSelectedIcon: false,
      ),
    );
  }
}
