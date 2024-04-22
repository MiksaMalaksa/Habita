
# Malashkevich Mikhail 253505

![habita_big_logo](https://github.com/MiksaMalaksa/Habita/assets/112797903/4310f858-e84f-4f3f-a2e0-09023d146c99)

# What is it?
Habita is an app aimed at habit "programs."  Such habit programs act like to-do lists with some features and time restrictions set by the user. Habits on such programs can be different types; some of them require multiple times completion during the day or maybe some of theme automatically complete during the day while you walk, and if you overmake yourself, they are presented in some fort of charts and statistics. An app can work both locally and online; in future versions, it might be used in implementing some sorts of competitions, where you can compete with your friends to see who can perform a habit the longest. One more difference between programs and other to-do lists is that programs can be mutuble or immutuble for a chosen period of time. In the case where the user chooses an immutable program but then decides to change it, he will have to start from scratch or bear with it. Program will have custom widgets and complex ui.
# Required features and screens

## Settings/profile screen
- Light/dark/system mode toggle
- Internationalization: cz, en, ru
- Edit profile settings

## Habit program screen
- CRUD of habit program (if program is changeable)
- Types of habits like: multiple, to-do, steps, steps, water
- By highlighting you can change positions of habits in list
- In mutuable programs you can add, delete, change habit fields through program

## Stats and home screens
- On home screen there is info about streak of done days and pinned habbits
- heat calendar of month progression

# Future plans
- Online versus mode with friends, where you can bet on something

# Techologies and architecture
<p float="left">
  <img src="https://user-images.githubusercontent.com/25181517/186150365-da1eccce-6201-487c-8649-45e9e99435fd.png" width="110" />
  <img src="https://user-images.githubusercontent.com/25181517/186150304-1568ffdf-4c62-4bdc-9cf1-8d8efcea7c5b.png" width="110" />
  <img src="https://avatars.githubusercontent.com/u/55202745?s=200&v=4"  width="110" />
  <img src= "https://raw.githubusercontent.com/github/explore/f4ec5347a36e06540a69376753a7c37a8cb5a136/topics/supabase/supabase.png" width="110"/>
  <img src= "https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png" height="110" />
</p>

- Hive: A fast and lightweight NoSQL database solution for local storage (local storage, offline mode)
- Supabase: An open-source platform combining PostgreSQL database with  authentication, real-time subscriptions, and serverless functions for building backend services (online, alternative to firebase).
- Flutter: A versatile and fast UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase, providing a rich set of pre-built widgets and tools for crafting beautiful and responsive user interfaces.
- Bloc: Implements the BLoC (Business Logic Component) architecture pattern in Flutter, facilitating separation of concerns and enabling predictable state management, making it easier to manage complex app logic and UI interactions.

Using internet_connection checker, we check internet connection, and if data loaded successfully we cache it, when we load data, firstly we check the internet, if there is no connection, load info from local storage. 

# Current app entities

```dart
import 'package:intl/intl.dart';

import '../../../../core/constants/min_dur.dart';
import 'habit_day.dart';

class HabitProgram {
  final List<HabitDay> habitDays;
  final String name;
  final String description;
  final bool muatable;
  final String programStart;
  final String programEnd;

  const HabitProgram({
    required this.habitDays,
    required this.name,
    required this.description,
    required this.muatable,
    required this.programStart,
    required this.programEnd,
  });

  int programLength() {
    final dateFormat = DateFormat('M/d/yyyy');
    final startDays = dateFormat.parse(programStart);
    int difference = dateFormat.parse(programEnd).difference(startDays).inDays;
    return difference;
  }

  factory HabitProgram.base() {
    final weekdays = [1, 2, 3, 4, 5, 6, 7];
    return HabitProgram(
      habitDays: List.generate(
        weekdays.length,
        (index) => HabitDay(
          weekday: weekdays[index],
          habits: [],
        ),
      ),
      name: '',
      description: '',
      muatable: false,
      programStart: DateFormat.yMd().format(DateTime.now()),
      programEnd: DateFormat.yMd()
          .format(DateTime.now().add(const Duration(days: minProgramDuration))),
    );
  }

  HabitProgram copyWith({
    List<HabitDay>? habitDays,
    String? name,
    String? description,
    bool? muatable,
    String? programStart,
    String? programEnd,
  }) {
    return HabitProgram(
      habitDays: habitDays ?? this.habitDays,
      name: name ?? this.name,
      description: description ?? this.description,
      muatable: muatable ?? this.muatable,
      programStart: programStart ?? this.programStart,
      programEnd: programEnd ?? this.programEnd,
    );
  }
}

```

```dart

import '../../../../core/enums/types.dart';

class Habit {
  final String id;
  final HabitType habitType;
  final String name;

  final bool isCompleted;
  final int highestStreak;
  final int currentStreak;
  final String? description;
  final int? waterTarget;
  final int? waterConsumed;
  final int? stepsTarget;
  final int? stepsProduced;
  final int? taskSteps;
  final int? completedSteps;
  final String? remainder;

  const Habit({
    required this.id,
    required this.habitType,
    required this.name,
    required this.isCompleted,
    required this.highestStreak,
    required this.currentStreak,
    this.description,
    this.waterTarget,
    this.waterConsumed,
    this.stepsTarget,
    this.stepsProduced,
    this.taskSteps,
    this.completedSteps,
    this.remainder,
  });

  factory Habit.base({required String id}) => Habit(
        id: id,
        habitType: HabitType.todo,
        name: '',
        description: '',
        isCompleted: false,
        highestStreak: 0,
        currentStreak: 0,
      );

  Habit copyWith({
    String? id,
    HabitType? habitType,
    String? name,
    bool? isCompleted,
    int? highestStreak,
    int? currentStreak,
    String? description,
    int? waterTarget,
    int? waterConsumed,
    int? stepsTarget,
    int? stepsProduced,
    int? taskSteps,
    int? completedSteps,
    String? taskStart,
    String? taskEnd,
    String? remainder,
  }) {
    return Habit(
      id: id ?? this.id,
      habitType: habitType ?? this.habitType,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      highestStreak: highestStreak ?? this.highestStreak,
      currentStreak: currentStreak ?? this.currentStreak,
      description: description ?? this.description,
      waterTarget: waterTarget ?? this.waterTarget,
      waterConsumed: waterConsumed ?? this.waterConsumed,
      stepsTarget: stepsTarget ?? this.stepsTarget,
      stepsProduced: stepsProduced ?? this.stepsProduced,
      taskSteps: taskSteps ?? this.taskSteps,
      completedSteps: completedSteps ?? this.completedSteps,
      remainder: remainder ?? this.remainder,
    );
  }

  Habit nullCopy({
    String? description,
    int? waterTarget,
    int? stepsTarget,
    int? taskSteps,
    String? remainder,
  }) {
    return Habit(
      id: id,
      habitType: habitType,
      name: name,
      isCompleted: isCompleted,
      highestStreak: highestStreak,
      currentStreak: currentStreak,
      waterConsumed: waterConsumed,
      stepsProduced: stepsProduced,
      taskSteps: taskSteps,
      completedSteps: completedSteps,
      remainder: remainder == '' ? null : this.remainder,
      stepsTarget: stepsTarget == -1 ? null : this.stepsTarget,
      description: description == '' ? null : this.description,
      waterTarget: waterTarget == -1 ? null : this.waterTarget,
    );
  }
}

```

```dart

import 'habit.dart';

class HabitDay {
  final int weekday;
  final List<Habit> habits;

  const HabitDay({
    required this.weekday,
    required this.habits,
  });
}

```
# Umls
![Screenshot 2024-02-27 134018](https://github.com/MiksaMalaksa/Habita/assets/112797903/7e81cd50-ba75-4fbc-b964-57ff187c5320)

