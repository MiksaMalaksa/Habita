import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:habita/core/common/entities/dialog.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/core/utils/show_dialog.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/presentation/bloc/habit_bloc.dart';
import 'package:habita/src/features/habits/presentation/screens/create_program.dart';
import 'package:habita/src/features/habits/presentation/widgets/add_icon_button.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/date_container_builder.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/habit_builder.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/progress_indicator.dart';
import 'package:intl/intl.dart';

//!App bar with program name and action like edit (drop down button with edit program or habits)
//!Today(label) calendar icon button which allows to check future day and check it habits
//!The same date thing but now like a scrollable thing
//!Coontainer which tells how many habits today where done
//!habits itself
//!By tapping on their labale new screen appeared with more info and circular indicator of how much of this
//!should be done

class HabitPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HabitPage(),
      );
  const HabitPage({super.key});

  @override
  State<HabitPage> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitPage> {
  int _selectedDayIndex = 0;
  DateTime _selectedDay = DateTime.now();

  void _setDay(int newDayIndex, DateTime newDay) {
    setState(() {
      _selectedDayIndex = newDayIndex;
      _selectedDay = newDay;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<HabitBloc>().add(GetHabitProgram());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(builder: (context, state) {
      if (state.program.name.isNotEmpty) {
        final rightPadding = MediaQuery.of(context).size.width * 0.042;
        //!we can choose days in the range of 7
        return Scaffold(
          appBar: AppBar(
            title: Text(
              //!PlaceHolder
              state.program.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).primaryColorLight.desaturate(0.1),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              AppBarButtonIcon(
                  icon: Icons.delete,
                  iconSize: MediaQuery.of(context).size.height * 0.036,
                  onPressed: () {
                    dialogBuilder(
                      context: context,
                      atributes: DialogAtributes(
                          label: S.of(context).warning,
                          body: S.of(context).submitDeleting,
                          actions: [
                            HabitaTextButton(
                              fontSize: 16,
                              weight: FontWeight.w800,
                              title: S.of(context).cancel,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            HabitaTextButton(
                              fontSize: 16,
                              weight: FontWeight.w800,
                              title: S.of(context).submit,
                              onPressed: () {
                                context
                                    .read<HabitBloc>()
                                    .add(DeleteHabitProgram());
                                Navigator.of(context).pop();
                              },
                            ),
                          ]),
                    );
                  }),
              AppBarButtonIcon(
                icon: Elusive.pencil,
                iconSize: MediaQuery.of(context).size.height * 0.026,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HabitProgramScreen(
                    fromScratch: false,
                    mutability: state.program.muatable,
                    appBarTitle: S.of(context).change,
                  ),
                )),
              ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.042,
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().day}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  DateBuilder(
                    selectedIndex: _selectedDayIndex,
                    onChoosedDate: (newIndex, newDate) {
                      _setDay(newIndex, newDate);
                    },
                  ),
                  const SizedBox(height: 26),
                  Padding(
                    padding: EdgeInsets.only(
                      right: rightPadding,
                    ),
                    child: const HabitProgressContainer(),
                  ),
                  const SizedBox(height: 26),
                  Padding(
                    padding: EdgeInsets.only(
                      right: rightPadding,
                    ),
                    child:
                        HabitBuilder(program: state.program, day: _selectedDay),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                S.of(context).noProgram,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Flexible(
                      flex: 1,
                      child: AddIconButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HabitProgramScreen(
                              fromScratch: true,
                              mutability: true,
                              appBarTitle: S.of(context).program,
                            ),
                          ),
                        ),
                        icon: Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}

class AppBarButtonIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;
  const AppBarButtonIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Theme.of(context)
            .primaryColorLight
            .desaturate(0.1)
            .withOpacity(0.8),
        size: iconSize,
      ),
    );
  }
}
