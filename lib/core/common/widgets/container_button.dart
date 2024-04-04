import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class ContainerButton extends StatelessWidget {
  final IconData icon;
  final Color backcolor;
  final VoidCallback onPressed;
  const ContainerButton(
      {super.key,
      required this.icon,
      required this.backcolor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: MediaQuery.of(context).size.width * 0.13,
      height: MediaQuery.of(context).size.width * 0.13,
      decoration: BoxDecoration(
        color: backcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: Theme.of(context).primaryColorDark.elevateAllColors(upParam: 10,opacity: 0.9)),
      ),
    );
  }
}
