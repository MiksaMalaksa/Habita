import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/design_icon.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/presentation/habit_page.dart';
import 'package:habita/src/features/home/presentation/home_page.dart';
import 'package:habita/src/features/settings/presentation/settings_page.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:habita/src/features/versus/presentation/versus_page.dart';

class PageManager extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const PageManager());
  const PageManager({super.key});

  @override
  State<PageManager> createState() => PageManagerState();
}

class PageManagerState extends State<PageManager> {
  final List<Widget> _pages = const [
    HomePage(),
    HabitPage(),
    VersusPage(),
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
            _bottomBarItem(label: S.of(context).home, icon: Icons.home),
            _bottomBarItem(
                label: S.of(context).program, icon: Icons.calendar_month),
            _bottomBarItem(
                label: S.of(context).versus, icon: RpgAwesome.broadsword),
            _bottomBarItem(label: S.of(context).profile, icon: Icons.person),
          ]),
    );
  }

  BottomNavigationBarItem _bottomBarItem({
    required String label,
    required IconData icon,
  }) {
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
