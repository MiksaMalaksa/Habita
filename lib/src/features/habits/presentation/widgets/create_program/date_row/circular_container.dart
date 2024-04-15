import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/src/themes/bloc/theme_bloc.dart';

class CircularContainer extends StatelessWidget {
  final IconData icon;
  const CircularContainer({
    super.key,
    required this.iconContainerHeight,
    required this.icon,
  });

  final double iconContainerHeight;

  @override
  Widget build(BuildContext context) {
    final currentTheme = BlocProvider.of<ThemeBloc>(context).state;
    return Container(
      width: iconContainerHeight,
      height: iconContainerHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: Theme.of(context).primaryColorDark),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.8).desaturate(0.1),
            currentTheme.currentMode == ThemeMode.dark
                ? Theme.of(context).secondaryHeaderColor
                : Theme.of(context)
                    .primaryColorDark
                    .withAlpha(200)
                    .withOpacity(0.6)
          ],
          stops: const [0.0, 0.35],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: iconContainerHeight / 1.5,
      ),
    );
  }
}
