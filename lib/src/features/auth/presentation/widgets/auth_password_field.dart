import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  const PasswordField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = false;

  void changeObscurence() {
    setState(() {
      _isObscure == false ? _isObscure = true : _isObscure = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme.headlineSmall;
    return TextFormField(
      controller: widget.controller,
      style: textTheme,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isObscure,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: changeObscurence,
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).iconTheme.color,
              )),
          prefixIcon: Icon(widget.icon),
          prefixIconColor: theme.iconTheme.color,
          hintText: widget.hintText,
          hintStyle:
              textTheme!.copyWith(color: textTheme.color!.withOpacity(0.6)),
          contentPadding: const EdgeInsets.all(22)),
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).hintMissing(widget.hintText);
        }

        if (value.length < 6) {
          return S.of(context).incorrectPassword;
        }

        return null;
      },
    );
  }
}
