import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatelessWidget {
  final File? image;
  final double size;
  final void Function(String path)? onPressed;
  const ProfilePicture({
    super.key,
    required this.size,
    this.image,
    this.onPressed,
  });

  Future<void> _pickPicture() async {
    final imagePath =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imagePath != null) {
      onPressed!(imagePath.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed != null ? _pickPicture : null,
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
                    child: image == null
                        ? Icon(
                            FontAwesome5.user,
                            size: size / 1.35,
                            color: Theme.of(context)
                                .primaryColorDark
                                .elevateAllColors(upParam: 0, opacity: 0.6),
                          )
                        : Image.file(image!),
                  )
                : Image.file(image!)),
      ),
    );
  }
}
