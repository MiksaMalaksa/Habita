import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class ProfilePicture extends StatelessWidget {
  final File? image;
  final double size;
  final bool showBorder;
  final VoidCallback? onPressed;

  const ProfilePicture({
    Key? key,
    required this.size,
    this.image,
    this.onPressed,
    this.showBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Hero(
        tag: 'Picture',
        child: SizedBox(
          height: size,
          width: size,
          child: ClipOval(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
              ),
              child: image == null
                  ? Icon(
                      FontAwesome5.user,
                      size: size / 1.35,
                      color: Theme.of(context)
                          .primaryColorDark
                          .elevateAllColors(upParam: 0, opacity: 0.6),
                    )
                  : Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
