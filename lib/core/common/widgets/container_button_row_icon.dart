import 'package:flutter/material.dart';

class ContainerButtonRowIcon extends StatelessWidget {
  final Color backColor;
  final String content;
  final VoidCallback onPressed;
  final IconData icon;
  final double fontSize;
  final double? iconSize;
  const ContainerButtonRowIcon({
    super.key,
    required this.backColor,
    required this.content,
    required this.onPressed,
    required this.icon,
    required this.fontSize,
    this.iconSize,
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
              color: Theme.of(context).primaryColor.withOpacity(0.3),
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
                size: iconSize ??  MediaQuery.of(context).size.width * 0.10,
                color: Colors.white,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
