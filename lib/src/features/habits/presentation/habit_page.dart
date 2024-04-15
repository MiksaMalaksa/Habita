import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/src/features/habits/presentation/screens/create_program.dart';
import 'package:habita/src/features/habits/presentation/screens/program_edit.dart';
import 'package:habita/src/features/habits/presentation/widgets/style_picker.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/date_container_builder.dart';
import 'package:habita/src/features/habits/presentation/widgets/habit_page/habit_tile.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //!PlaceHolder
          'Program name',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColorLight.desaturate(0.1),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(ProgramEdit.route()),
            icon: Icon(
              Elusive.pencil,
              color: Theme.of(context)
                  .primaryColorLight
                  .desaturate(0.1)
                  .withOpacity(0.8),
              size: MediaQuery.of(context).size.height * 0.026,
            ),
          )
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
              Row(
                children: [
                  Text(
                    '${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().day}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month,
                        color: Theme.of(context)
                            .primaryColorLight
                            .desaturate(0.1)
                            .withOpacity(0.8),
                        size: MediaQuery.of(context).size.height * 0.032,
                      ))
                ],
              ),
              const SizedBox(height: 12),
              const DateBuilder(),
              const SizedBox(height: 26),
              const HabitProgressContainer(),
              const SizedBox(height: 26),
              const HabitTile(
                icon: Icons.bed,
                backColor: Color.fromARGB(255, 138, 224, 140),
              ),
              ElevatedButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const ColorPicker(),
                      ),
                  child: Container(
                    width: 200,
                    height: 100,
                    color: Colors.amber,
                  )),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HabitProgramScreen(
                          appBarTitle: 'Habits',
                        ),
                      )),
                  child: Container(
                    width: 200,
                    height: 100,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
