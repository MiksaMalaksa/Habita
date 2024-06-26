import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:habita/core/extensions/color_rgb.dart';

//!Somehow they moved to right, and not correctly centered
final _exceptionIconsCodes = [
  FontAwesome5.laptop.codePoint,
  FontAwesome5.swimmer.codePoint,
  FontAwesome5.bicycle.codePoint,
  FontAwesome5.bed.codePoint,
  FontAwesome5.spa.codePoint,
];

class ContainerButton extends StatelessWidget {
  final IconData icon;
  final Color backcolor;
  final VoidCallback onPressed;
  final Color? iconColor;
  const ContainerButton(
      {super.key,
      required this.icon,
      required this.backcolor,
      required this.onPressed,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.13,
        height: MediaQuery.of(context).size.width * 0.13,
        decoration: BoxDecoration(
          color: backcolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Padding(
            padding: _exceptionIconsCodes.contains(icon.codePoint)
                ? EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.013)
                : EdgeInsets.zero,
            child: IconButton(
              iconSize: MediaQuery.of(context).size.width * 0.06,
              onPressed: onPressed,
              icon: Icon(icon),
              color: iconColor ??
                  Theme.of(context)
                      .primaryColorDark
                      .elevateAllColors(upParam: 10, opacity: 0.9),
            ),
          ),
        ));
  }
}
