import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';

class ChangePasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const ChangePasswordField({
    Key? key,
    required this.controller,
    required this.hintText,

  }) : super(key: key);

  @override
  State<ChangePasswordField> createState() => _ChangeTextFieldState();
}

class _ChangeTextFieldState extends State<ChangePasswordField> {
  bool _isObscure = false;

  void _changeObscurence() {
    setState(() {
      _isObscure == false ? _isObscure = true : _isObscure = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = 20.0;
    return TextFormField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.headlineSmall,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isObscure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: _changeObscurence,
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).iconTheme.color,
            )),
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
        hintText: widget.hintText,
      ),
      //*validation
      validator: (value) {
        if (value!.isNotEmpty && value.length < 6) {
          return S.of(context).incorrectPassword;
        }
        return null;
      },
    );
  }
}
