import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/design_icon.dart';
import 'package:habita/src/features/habits/presentation/habit_page.dart';
import 'package:habita/src/features/home/presentation/home_page.dart';
import 'package:habita/src/features/settings/presentation/profile_page.dart';
import 'package:habita/src/features/stats/presentation/stats_page.dart';

class PageManager extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const PageManager());
  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  final List<Widget> _pages = const [
    HomePage(),
    StatsPage(),
    HabitPage(),
    ProfilePage(),
  ];

  int _currentIndex = 0;

  void switchPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: switchPage,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          items: [
            _bottomBarItem(label: 'Home', icon: Icons.home),
            _bottomBarItem(label: 'Stats', icon: Icons.bar_chart_sharp),
            _bottomBarItem(label: 'Program', icon: Icons.calendar_month),
            _bottomBarItem(label: 'Profile', icon: Icons.person),
          ]),
    );
  }

  BottomNavigationBarItem _bottomBarItem(
      {required String label, required IconData icon}) {
    return BottomNavigationBarItem(
      label: label,
      icon: DesignedIcon(
        icon: icon,
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
      ),
      activeIcon: DesignedIcon(
        icon: icon,
        color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
      ),
    );
  }
}
