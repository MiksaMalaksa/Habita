import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class ContainerButtonRowIcon extends StatelessWidget {
  final Color backColor;
  final String content;
  final VoidCallback onPressed;
  final IconData icon;
  final double fontSize;
  const ContainerButtonRowIcon({
    super.key,
    required this.backColor,
    required this.content,
    required this.onPressed,
    required this.icon,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2,
              color: backColor.elevateAllColors(
                upParam: 20,
                opacity: 0.9,
              ),
            )),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                content,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: fontSize,
                      color: Colors.white,
                    ),
              ),
            ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                icon,
                size: MediaQuery.of(context).size.width * 0.10,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
