import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DesignedIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double? size;
  const DesignedIcon(
      {super.key, required this.icon, this.size = 35, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
