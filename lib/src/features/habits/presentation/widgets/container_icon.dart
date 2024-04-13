import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class ContainerShowCase extends StatelessWidget {
  final IconData icon;
  final Color backcolor;
  final Color? iconColor;
  const ContainerShowCase({
    super.key,
    required this.icon,
    required this.backcolor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.099,
        height: MediaQuery.of(context).size.width * 0.099,
        decoration: BoxDecoration(
          color: backcolor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            color: iconColor ??
                Theme.of(context)
                    .primaryColorDark
                    .elevateAllColors(upParam: 10, opacity: 0.9),
          ),
        ));
  }
}
