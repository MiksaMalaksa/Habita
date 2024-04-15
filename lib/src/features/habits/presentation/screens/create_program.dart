import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/habits/presentation/widgets/create_program/date_row/date_row.dart';
import 'package:habita/src/features/habits/presentation/widgets/create_program/segmented_button.dart';
import 'package:habita/src/features/habits/presentation/widgets/text_field.dart';

class HabitProgramScreen extends StatefulWidget {
  final String appBarTitle;
  const HabitProgramScreen({super.key, required this.appBarTitle});

  @override
  State<HabitProgramScreen> createState() => _HabitProgramScreenState();
}

class _HabitProgramScreenState extends State<HabitProgramScreen> {
  //!takes from db current name
  final nameEditController = TextEditingController();
  final aimEditController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameEditController.dispose();
    aimEditController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<HabitBloc>().add(const HabitProgramChanging());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Theme.of(context).primaryColorLight.desaturate(0.9),
        );
    return BlocBuilder<HabitBloc, HabitState>(builder: (context, state) {
      if (state is HabitChanging) {
        return Scaffold(
          appBar: HabitaAppBar(
            title: widget.appBarTitle,
            actions: [
              HabitaTextButton(
                onPressed: () {},
                title: S.of(context).submit,
                fontSize: MediaQuery.of(context).size.height * 0.023,
                weight: FontWeight.bold,
              )
            ],
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/busy.png'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Program name',
                        style: textTheme,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HabitTextField(
                        controller: nameEditController,
                        hintText: 'Naming',
                      ),
                      Text(
                        'Aim',
                        style: textTheme,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HabitTextField(
                        controller: aimEditController,
                        maxChars: 50,
                        hintText: 'Aim of the program',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 10,
                        width: double.infinity,
                        color:
                            Theme.of(context).primaryColorDark.withAlpha(100),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Mutability',
                        style: textTheme,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SegmentedMutability(
                        selections: {state.changeableProgram.muatable},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Set dates',
                        style: textTheme,
                      ),
                      DatePickerRow(
                        state: state,
                        startDate: state.changeableProgram.programStart,
                        endDate: state.changeableProgram.programEnd,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        return Center(
          child: Text(
            'Unexpected error',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        );
      }
    });
  }
}
