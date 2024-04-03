import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class ContainerButtonRow extends StatelessWidget {
  final Color backColor;
  final String content;
  final VoidCallback onPressed;
  final String? assetPath;
  final IconData? icon;
  final double? fontSize;
  const ContainerButtonRow({
    super.key,
    required this.backColor,
    required this.content,
    required this.onPressed,
    this.assetPath,
    this.icon,
    this.fontSize,
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
                      fontSize:
                          fontSize ?? MediaQuery.of(context).size.width * 0.06,
                      color: Colors.white,
                    ),
              ),
            ),
            Flexible(
                child: icon == null && assetPath == null
                    ? const Text('')
                    : icon == null
                        ? Image(
                            width: MediaQuery.of(context).size.width * 0.13,
                            height: MediaQuery.of(context).size.width * 0.13,
                            image: AssetImage(assetPath!),
                          )
                        : Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(icon!,size: MediaQuery.of(context).size.width * 0.10,),
                        ))
          ],
        ),
      ),
    );
  }
}
