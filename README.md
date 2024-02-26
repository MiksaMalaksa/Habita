
# Malashkevich Mikhail 253505

![habita_big_logo](https://github.com/MiksaMalaksa/Habita/assets/112797903/a1e1cefd-35ee-48a8-9ae0-1945e56dd19d)

# What is it?
Habita is an app aimed at habit "programs."  Such habit programs act like to-do lists with some features and time restrictions set by the user. Habits on such programs can be different types; some of them have time limits during the day, some of them require multiple times completion during the day, and there are also habits that can be finished only in a period of time when the user starts the timer, and if you overmake yourself, they are presented in different types of charts. An app can work both locally and online; in future versions, it might be used in implementing some sorts of competitions, where you can compete with your friends to see who can perform a habit the longest. One more difference between programs and other to-do lists is that programs can be mutuble or immutuble for a chosen period of time. In the case where the user chooses an immutable program but then decides to change it, he will have to start from scratch or bear with it.
# Required features and screens

## Settings/profile screen
- Light/dark mode toggle
- Localization
- Edit profile settings
- Clear user/settings info's

## Habit program screen
- CRUD of habit program (if program is changeable)
- Types of habits like: timer, multiple, to-do, steps, notes, steps, water

## Stats and home screens
- FLcharts for habits stats (stats screen)
- Short stats and deadlines of habits (home screen)

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
class HabitProgram {
  final bool isChangeable;
  final List<List<Habit>> habits;
  final int duration;
  final DateTime creationDate;
  final DateTime experationDate;

  HabitProgram(
      {required this.isChangeable,
      required this.habits,
      required this.duration,
      required this.creationDate,
      required this.experationDate});
}
```

```dart
class Habit {
  final DayOfTheWeek habitDay;
  final HabitType habitType;
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final double? waterTarget;
  final double? waterConsumed;
  final int? stepsTarget;
  final int? stepsProduced;
  final int? taskSteps;
  final int? completedSteps;

  Habit(
      {required this.habitDay,
      required this.habitType,
      required this.id,
      required this.title,
      required this.description,
      required this.isCompleted,
      required this.waterTarget,
      required this.waterConsumed,
      required this.stepsTarget,
      required this.stepsProduced,
      required this.taskSteps,
      required this.completedSteps});
}
```

```dart
class User {
  final String avatarPath;
  final String nickName;
  final String email;

  User({required this.avatarPath, required this.nickName, required this.email});
}
```
# Umls
![Screenshot 2024-02-26 212048](https://github.com/MiksaMalaksa/Habita/assets/112797903/ca8a9642-6e7c-4be8-954a-e026106900c4)
![Screenshot 2024-02-26 212100](https://github.com/MiksaMalaksa/Habita/assets/112797903/1d03033a-3f70-4b5e-a1de-bceb25fc4cf1)
![Screenshot 2024-02-26 212107](https://github.com/MiksaMalaksa/Habita/assets/112797903/af802291-0b56-4d99-9878-4ad6d840ff4a)
![Screenshot 2024-02-26 212038](https://github.com/MiksaMalaksa/Habita/assets/112797903/aed6ef70-2d24-4a7b-9f7b-55cc2f02ac0d)
