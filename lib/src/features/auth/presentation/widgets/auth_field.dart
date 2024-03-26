import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/auth/presentation/pages/login_page.dart';
import 'package:habita/src/features/auth/presentation/pages/signup_page.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String page;
  final IconData icon;
  final bool isObscure;
  const AuthField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.icon,
      this.isObscure = false,
      this.page = ''});

  @override
  Widget build(BuildContext context) {
    final eyeIcon = isObscure ? Icons.visibility_off : Icons.visibility;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme.headlineSmall;
    return TextFormField(
      controller: controller,
      style: textTheme,
      //*Type of keyboard depending on hint
      keyboardType: hintText == S.of(context).email
          ? TextInputType.emailAddress
          : hintText == S.of(context).password
              ? TextInputType.visiblePassword
              : TextInputType.name,
      //*Hiding password
      obscureText: isObscure,
      //*Deco
      decoration: InputDecoration(
          suffixIcon: hintText == S.of(context).password
              ? IconButton(
                  onPressed: 
                  
                  () {
                    if (page == 'login') {
                      context
                          .findAncestorStateOfType<LoginState>()
                          ?.obscurePassword();
                    } else if (page == 'signUp') {
                      context
                          .findAncestorStateOfType<SignUpState>()
                          ?.obscurePassword();
                    }
                  },
                  icon: Icon(
                    eyeIcon,
                    color: Theme.of(context).iconTheme.color,
                  ))
              : null,
          prefixIcon: Icon(icon),
          prefixIconColor: theme.iconTheme.color,
          hintText: hintText,
          hintStyle:
              textTheme!.copyWith(color: textTheme.color!.withOpacity(0.6)),
          contentPadding: const EdgeInsets.all(22)),
      //*Validation
      validator: (value) {
        //*mutual case
        if (value!.isEmpty) {
          return S.of(context).hintMissing(hintText);
        }
        //*password case
        if (hintText == S.of(context).password) {
          if (value.length < 6) {
            return S.of(context).incorrectPassword;
          }
        }
        return null;
      },
    );
  }
}
