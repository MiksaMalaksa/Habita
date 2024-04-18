import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:habita/core/common/widgets/action_drop_down.dart';
import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/common/widgets/drop_down_menu.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/core/extensions/time_to_string.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/domain/entities/habit.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/habits/presentation/widgets/check_box_dropdown.dart';
import 'package:habita/src/features/habits/presentation/widgets/container_icon.dart';
import 'package:habita/src/features/habits/presentation/widgets/style_picker.dart';
import 'package:habita/src/features/habits/presentation/widgets/text_field.dart';
import 'package:habita/src/themes/bloc/theme_bloc.dart';
import 'package:uuid/uuid.dart';

class HabitView extends StatefulWidget {
  final bool showChooseDays;
  final String appBarTitle;
  const HabitView({
    super.key,
    required this.showChooseDays,
    required this.appBarTitle,
  });

  @override
  State<HabitView> createState() => _HabitViewState();
}

class _HabitViewState extends State<HabitView> {
  final habitNameController = TextEditingController();
  final habitDescriptionEditController = TextEditingController();
  final newHabitId = const Uuid().v4();
  final formKey = GlobalKey<FormState>();
  bool editingFinished = false;

  @override
  void dispose() {
    habitNameController.dispose();
    habitDescriptionEditController.dispose();
    if (!editingFinished) {
      context.read<HabitBloc>().add(HabitEditUnfinished(
          days: const [1, 2, 3, 4, 5, 6, 7], habitId: newHabitId));
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<HabitBloc>().add(
          HabitChange(
            days: const [1, 2, 3, 4, 5, 6, 7],
            habitId: newHabitId,
          ),
        );
  }

 
  bool readyToSubmit = false;

  String? pickedTime;

  HabitType currentType = HabitType.notes;

  HabitIcon currentHabitIcon = const HabitIcon(
    color: Color.fromARGB(255, 138, 224, 140),
    icon: FontAwesome5.laptop_code,
  );

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
        context.read<HabitBloc>().add(HabitProgramChange(
              days: const [1, 2, 3, 4, 5, 6, 7],
              habitId: newHabitId,
              color: newHabitIcon.color,
              iconData: newHabitIcon.icon,
            ));
      }
    });
  }


 final List<String> _daysOfWeek = [
    'All',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    final currentMode = context.read<ThemeBloc>().state.currentMode;
    final textTheme = Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Theme.of(context).primaryColorLight.desaturate(0.9),
        );
    return SafeArea(
      child: BlocBuilder<HabitBloc, HabitState>(
        builder: (context, state) {
          if (state is ProgramChanging) {
            Habit currentHabit = state.changeableProgram.habits[0].habits
                .firstWhere((habit) => habit.id == newHabitId,
                    orElse: () => Habit.base(id: newHabitId));
            return Scaffold(
              appBar: HabitaAppBar(
                title: widget.appBarTitle,
                actions: [
                  HabitaTextButton(
                    onPressed: () {
                      editingFinished = true;
                      Navigator.of(context).pop();
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
                                currentHabitIcon.icon,
                                currentHabitIcon.color,
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
                              currentHabitIcon.icon,
                              currentHabitIcon.color,
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
                          onSubmitted: () => context
                              .read<HabitBloc>()
                              .add(HabitProgramChange(
                                name: habitNameController.text,
                              )),
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
                          onSubmitted: () {
                            context.read<HabitBloc>().add(HabitProgramChange(
                                name: habitDescriptionEditController.text));
                          },
                          controller: habitDescriptionEditController,
                          maxChars: 10,
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
                              color: pickedTime != null
                                  ? const Color.fromARGB(255, 138, 224, 140)
                                  : null,
                              entrie: pickedTime == null
                                  ? S.of(context).off
                                  : pickedTime.toString(),
                              onHold: () {},
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
                                    setState(() {
                                      pickedTime =
                                          reminder.timeToString(context);
                                    });
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
                            initialValue: 'Monday',
                            getInitial: () async => 'Monday',
                            onChoosed: (value) {
                              print('Selected: $value');
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
                            initialValue: S.of(context).notes,
                            getInitial: () async => S.of(context).notes,
                            onChoosed: (choosedType) {
                              setState(() {
                                currentType =
                                    HabitTypeConverter.toHabitType(choosedType);
                              });
                            },
                          ),
                        ),
                      ],
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
        },
      ),
    );
  }
}
