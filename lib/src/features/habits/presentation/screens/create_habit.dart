import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/widgets/action_drop_down.dart';
import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/common/widgets/drop_down_menu.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/constants/localised_days.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/core/extensions/time_to_string.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/habits/presentation/widgets/check_box_dropdown.dart';
import 'package:habita/src/features/habits/presentation/widgets/container_icon.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_view/type_manager.dart';
import 'package:habita/src/features/habits/presentation/widgets/style_picker.dart';
import 'package:habita/src/features/habits/presentation/widgets/text_field.dart';
import 'package:habita/src/themes/bloc/theme_bloc.dart';
import 'package:uuid/uuid.dart';

class HabitView extends StatefulWidget {
  final String appBarTitle;
  const HabitView({
    super.key,
    required this.appBarTitle,
  });

  @override
  State<HabitView> createState() => _HabitViewState();
}

class _HabitViewState extends State<HabitView> {
  final habitNameController = TextEditingController();
  final habitDescriptionEditController = TextEditingController();
  final habitTargetController = TextEditingController();
  final newHabitId = const Uuid().v4();
  final formKey = GlobalKey<FormState>();
  late List<String> _daysOfWeek;
  late List<int> _choosedDays =
      List.generate(_daysOfWeek.length - 1, (index) => index);

  @override
  void dispose() {
    habitNameController.dispose();
    habitDescriptionEditController.dispose();
    habitTargetController.dispose();
    super.dispose();
  }

  void _localisedays() {
    _daysOfWeek = LocalisedDays.localisedBig(context, true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localisedays();
  }

  @override
  void initState() {
    context.read<HabitBloc>().add(
          HabitChange(habitId: newHabitId),
        );
    super.initState();
  }

  Future<void> onChangeImageChange(
      BuildContext context, IconData icon, Color color) async {
    await showDialog(
      context: context,
      builder: (context) => ColorPicker(
        color: color,
        icon: icon,
      ),
    ).then((newHabitIcon) {
      if (newHabitIcon != null && newHabitIcon is HabitIcon) {
        context.read<HabitBloc>().add(HabitChange(
              color: newHabitIcon.color,
              iconData: newHabitIcon.icon,
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentMode = context.read<ThemeBloc>().state.currentMode;
    final textTheme = Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Theme.of(context).primaryColorLight.desaturate(0.9),
        );
    return SafeArea(
      child: BlocBuilder<HabitBloc, HabitState>(
        builder: (context, state) {
          if (state is HabitChanging) {
            Habit currentHabit = state.changeableHabit;
            final typeRecord = HabitTypeConverter.fromTypeToColorIcon(
                context, state.changeableHabit.habitType);
            return Scaffold(
              appBar: HabitaAppBar(
                title: widget.appBarTitle,
                actions: [
                  HabitaTextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          _choosedDays.isNotEmpty) {
                        int? waterTarget;
                        int? taskTarget;
                        int? stepsTarget;
                        int? waterConsumed;
                        int? taskCompletedSteps;
                        int? stepsProduced;

                        switch (currentHabit.habitType) {
                          case HabitType.multiple:
                            taskTarget = int.parse(habitTargetController.text);
                            taskCompletedSteps = 0;
                          case HabitType.steps:
                            stepsTarget = int.parse(habitTargetController.text);
                            stepsProduced = 0;
                          case HabitType.water:
                            waterTarget = int.parse(habitTargetController.text);
                            waterConsumed = 0;
                          case HabitType.todo:
                            taskCompletedSteps = 0;
                            taskTarget = 1;
                        }

                        context.read<HabitBloc>().add(
                              HabitProgramChange(
                                habit: Habit(
                                  id: newHabitId,
                                  color: currentHabit.color,
                                  description: habitDescriptionEditController
                                          .text
                                          .trim()
                                          .isEmpty
                                      ? null
                                      : habitDescriptionEditController.text
                                          .trim(),
                                  icon: currentHabit.icon,
                                  habitType: currentHabit.habitType,
                                  name: habitNameController.text.trim(),
                                  isCompleted: false,
                                  highestStreak: 0,
                                  currentStreak: 0,
                                  remainder: currentHabit.remainder,
                                  waterConsumed: waterConsumed,
                                  waterTarget: waterTarget,
                                  stepsTarget: stepsTarget,
                                  stepsProduced: stepsProduced,
                                  taskSteps: taskTarget,
                                  completedSteps: taskCompletedSteps,
                                ),
                                days: _choosedDays,
                              ),
                            );
                        Navigator.of(context).pop();
                      }
                      if (_choosedDays.isEmpty) {
                        showSnackBar(
                            context: context,
                            content: S.of(context).setAtLeast1Day);
                      }
                    },
                    title: S.of(context).submit,
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                    weight: FontWeight.bold,
                  )
                ],
              ),
              body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 26),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ContainerShowCase(
                            containerSize:
                                MediaQuery.of(context).size.width * 0.3,
                            icon: currentHabit.icon,
                            backcolor: currentHabit.color,
                            iconColor: Colors.white,
                            onTap: () {
                              onChangeImageChange(
                                context,
                                state.changeableHabit.icon,
                                state.changeableHabit.color,
                              );
                            },
                          ),
                        ),
                        Center(
                          child: HabitaTextButton(
                            title: S.of(context).change,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.032,
                            onPressed: () => onChangeImageChange(
                              context,
                              state.changeableHabit.icon,
                              state.changeableHabit.color,
                            ),
                            weight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).habitName,
                          style: textTheme,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HabitTextField(
                          onSubmitted: () {},
                          controller: habitNameController,
                          maxChars: 15,
                          hintText: S.of(context).nameOfHabit,
                        ),
                        Text(
                          S.of(context).description,
                          style: textTheme,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HabitTextField(
                          onSubmitted: () {},
                          controller: habitDescriptionEditController,
                          maxChars: 14,
                          requireCheck: false,
                          hintText: S.of(context).smallDescription,
                        ),
                        Text(
                          S.of(context).setReminder,
                          style: textTheme,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ActionDropDown(
                              icon: Icons.notification_add,
                              color: state.changeableHabit.remainder != null
                                  ? const Color.fromARGB(255, 138, 224, 140)
                                  : null,
                              entrie: state.changeableHabit.remainder == null
                                  ? S.of(context).off
                                  : state.changeableHabit.remainder!,
                              onHold: () {
                                context.read<HabitBloc>().add(const HabitChange(
                                    remainder: null, dropReminder: true));
                              },
                              onPressed: () {
                                Navigator.of(context).push(showPicker(
                                  context: context,
                                  value: Time.fromTimeOfDay(
                                    TimeOfDay(
                                        hour: DateTime.now().hour,
                                        minute: DateTime.now().minute),
                                    null,
                                  ),
                                  cancelStyle: textTheme.copyWith(
                                    color: Theme.of(context).primaryColorDark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  okStyle: textTheme.copyWith(
                                    color: Theme.of(context).primaryColorDark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  accentColor: currentMode == ThemeMode.dark
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).primaryColorLight,
                                  onChange: (reminder) {
                                    context.read<HabitBloc>().add(HabitChange(
                                        remainder:
                                            reminder.timeToString(context)));
                                  },
                                ));
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).habitDays,
                          style: textTheme,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: HabitaCheckBoxDropDown(
                            entries: _daysOfWeek,
                            initialValue: S.of(context).all,
                            onChoosed: (values) {
                              if (values[0] == true) {
                                _choosedDays = List<int>.generate(
                                    values.length - 1, (index) => index + 1);
                              } else {
                                _choosedDays = [];
                                for (int i = 1; i < values.length; i++) {
                                  if (values[i]) {
                                    _choosedDays.add(i - 1);
                                  }
                                }
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).habitType,
                          style: textTheme,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: HabitaDropDown<String>(
                            entries: HabitTypeConverter.translatedList(context),
                            initialValue: S.of(context).todo,
                            onChoosed: (choosedType) {
                              context.read<HabitBloc>().add(
                                    HabitChange(
                                      type: HabitTypeConverter.toHabitType(
                                        context,
                                        choosedType,
                                      ),
                                    ),
                                  );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TypeManager(
                          type: state.changeableHabit.habitType,
                          icon: typeRecord.$1,
                          text: typeRecord.$2,
                          maxValue: typeRecord.$3,
                          maxLength: 5,
                          controller: habitTargetController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
