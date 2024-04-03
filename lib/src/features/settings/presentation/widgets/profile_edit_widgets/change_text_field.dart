import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';

class ChangeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const ChangeTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = 20.0;
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.headlineSmall,
      keyboardType: hintText == S.of(context).email
          ? TextInputType.emailAddress
          : TextInputType.name,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
        ),
        hintText: hintText,
      ),
      //*validation
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).hintMissing(hintText);
        }
        return null;
      },
    );
  }
}
