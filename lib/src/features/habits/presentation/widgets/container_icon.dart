import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class ContainerShowCase extends StatelessWidget {
  final IconData icon;
  final Color backcolor;
  final Color? iconColor;
  final double? containerSize;
  final VoidCallback? onTap;
  const ContainerShowCase({
    super.key,
    required this.icon,
    required this.backcolor,
    this.iconColor,
    this.containerSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final defaultContainerSize = MediaQuery.of(context).size.width * 0.099;
    final iconSize =
        containerSize == null ? defaultContainerSize / 2 : containerSize! / 2;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: containerSize ?? defaultContainerSize,
          height: containerSize ?? defaultContainerSize,
          decoration: BoxDecoration(
            color: backcolor,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor ??
                  Theme.of(context)
                      .primaryColorDark
                      .elevateAllColors(upParam: 10, opacity: 0.9),
            ),
          )),
    );
  }
}
