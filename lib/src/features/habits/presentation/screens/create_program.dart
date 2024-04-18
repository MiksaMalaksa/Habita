import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/habits/presentation/screens/create_habit.dart';
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
    context.read<HabitBloc>().add(const HabitProgramChange());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Theme.of(context).primaryColorLight.desaturate(0.9),
        );
    return BlocBuilder<HabitBloc, HabitState>(builder: (context, state) {
      if (state is ProgramChanging) {
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
                        onSubmitted: () => context.read<HabitBloc>().add(
                            HabitProgramChange(
                                name: nameEditController.text)),
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
                        onSubmitted: () => context.read<HabitBloc>().add(
                            HabitProgramChange(name: aimEditController.text)),
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Current habbits',
                        style: textTheme,
                      ),
                      Row(
                        children: [
                          const Spacer(
                            flex: 3,
                          ),
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HabitView(
                                    showChooseDays: false,
                                    appBarTitle: S.of(context).create,
                                  ),
                                ),
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                    ),
                                    color: Theme.of(context).primaryColorLight),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: MediaQuery.of(context).size.height *
                                        0.045,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
