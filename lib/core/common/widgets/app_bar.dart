import 'package:flutter/material.dart';

class HabitaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool center;
  const HabitaAppBar({
    super.key,
    required this.title,
    this.actions,
    this.center = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      actions: actions,
      centerTitle: center,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
