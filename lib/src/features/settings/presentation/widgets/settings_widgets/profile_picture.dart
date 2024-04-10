import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class ProfilePicture extends StatelessWidget {
  final File? image;
  final double size;
  final VoidCallback? onPressed;
  final VoidCallback? onHold;
  const ProfilePicture({
    super.key,
    required this.size,
    this.image,
    this.onPressed,
    this.onHold,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: () {},
      child: Hero(
        tag: 'Picture',
        child: SizedBox(
            height: size,
            width: size,
            child: image == null
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColorDark,
                          width: 4,
                          style: BorderStyle.solid),
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Icon(
                      FontAwesome5.user,
                      size: size / 1.35,
                      color: Theme.of(context)
                          .primaryColorDark
                          .elevateAllColors(upParam: 0, opacity: 0.6),
                    ),
                  )
                : Image.file(image!)),
      ),
    );
  }
}
