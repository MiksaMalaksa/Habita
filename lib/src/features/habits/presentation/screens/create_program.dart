import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/constants/date_format.dart';
import 'package:habita/core/constants/localised_days.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit_program.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/habits/presentation/screens/create_habit.dart';
import 'package:habita/src/features/habits/presentation/widgets/add_icon_button.dart';
import 'package:habita/src/features/habits/presentation/widgets/create_program/date_row/date_row.dart';
import 'package:habita/src/features/habits/presentation/widgets/create_program/habit_build.dart';
import 'package:habita/src/features/habits/presentation/widgets/create_program/segmented_button.dart';
import 'package:habita/src/features/habits/presentation/widgets/text_field.dart';
import 'package:intl/intl.dart';

class HabitProgramScreen extends StatefulWidget {
  final bool fromScratch;
  final bool mutability;
  final String appBarTitle;
  const HabitProgramScreen({
    super.key,
    required this.appBarTitle,
    required this.fromScratch,
    required this.mutability,
  });

  @override
  State<HabitProgramScreen> createState() => _HabitProgramScreenState();
}

class _HabitProgramScreenState extends State<HabitProgramScreen> {
  //!takes from db current name
  final nameEditController = TextEditingController();
  final aimEditController = TextEditingController();
  late HabitProgram oldProgram;
  final formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    if (!widget.fromScratch) {
      context.read<HabitBloc>().add(
            HabitProgramChange(
              description: oldProgram.description,
              muatable: oldProgram.muatable,
              habitDays: oldProgram.habitDays,
              name: oldProgram.name,
              programStart: oldProgram.programStart,
              programEnd: oldProgram.programEnd,
            ),
          );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameEditController.dispose();
    aimEditController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context
        .read<HabitBloc>()
        .add(HabitProgramChange(fromScratch: widget.fromScratch));
    oldProgram = context.read<HabitBloc>().state.program;
    if (!widget.fromScratch) {
      nameEditController.text = oldProgram.name;
      aimEditController.text = oldProgram.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Theme.of(context).primaryColorLight.desaturate(0.9),
        );
    return BlocBuilder<HabitBloc, HabitState>(builder: (context, state) {
      return Scaffold(
        appBar: HabitaAppBar(
          title: widget.appBarTitle,
          actions: [
            HabitaTextButton(
              onPressed: () {
                //!check if days was chosed correct
                final dateFormatter = DateFormat(dateFormat);
                final startDays =
                    dateFormatter.parse(state.program.programStart);
                final difference = dateFormatter
                    .parse(state.program.programEnd)
                    .difference(startDays);
                //!check if habits are empty
                final habitsExists = state.program.habitDays
                    .any((element) => element.habits.isNotEmpty);
                if (formKey.currentState!.validate() &&
                    habitsExists &&
                    difference.inDays >= 7) {
                  context.read<HabitBloc>().add(
                        HabitProgramChange(
                            name: nameEditController.text,
                            description: aimEditController.text),
                      );
                  Navigator.of(context).pop();
                }
                if (!habitsExists) {
                  showSnackBar(
                      context: context, content: S.of(context).atLeast1Habit);
                }
                if (difference.inDays < 7) {
                  showSnackBar(
                      context: context, content: S.of(context).atLeast7Days);
                }
              },
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
                      S.of(context).programName,
                      style: textTheme,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HabitTextField(
                      onSubmitted: () {},
                      controller: nameEditController,
                      hintText: state.program.name.isEmpty
                          ? S.of(context).programName
                          : state.program.name,
                    ),
                    Text(
                      S.of(context).aim,
                      style: textTheme,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HabitTextField(
                      onSubmitted: () {},
                      controller: aimEditController,
                      maxChars: 50,
                      hintText: state.program.description.isEmpty
                          ? S.of(context).aimOfTheProgram
                          : state.program.description,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //!If programm is imuatable we can not see other fields
                    widget.mutability
                        ? Column(
                            children: [
                              Container(
                                height: 10,
                                width: double.infinity,
                                color: Theme.of(context)
                                    .primaryColorDark
                                    .withAlpha(100),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                S.of(context).mutability,
                                style: textTheme,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SegmentedMutability(
                                selections: {state.program.muatable},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                S.of(context).setDates,
                                style: textTheme,
                              ),
                              DatePickerRow(
                                state: state,
                                startDate: state.program.programStart,
                                endDate: state.program.programEnd,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 10,
                                width: double.infinity,
                                color: Theme.of(context)
                                    .primaryColorDark
                                    .withAlpha(100),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                S.of(context).currentHabbits,
                                style: textTheme,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: ListHabitBuilder(
                                  translatedDays:
                                      LocalisedDays.localisedSmall(context),
                                ),
                              ),
                              Row(
                                children: [
                                  const Spacer(
                                    flex: 3,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: AddIconButton(
                                      onPressed: () =>
                                          Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => HabitView(
                                            appBarTitle: S.of(context).create,
                                          ),
                                        ),
                                      ),
                                      icon: Icons.add,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
