import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:habita/src/features/auth/presentation/widgets/auth_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void obscurePassword() {
    setState(() {
      hidePassword == false ? hidePassword = true : hidePassword = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).signIn,
                  style: textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 40),
                ),
                const SizedBox(
                  height: 22,
                ),
                AuthField(
                  hintText: S.of(context).email,
                  icon: Icons.email,
                  controller: emailTextController,
                ),
                const SizedBox(
                  height: 17,
                ),
                AuthField(
                  hintText: S.of(context).password,
                  icon: Icons.password,
                  controller: passwordTextController,
                  isObscure: hidePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                const AuthButton(),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      text: S.of(context).noAccount,
                      style: textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: S.of(context).signIn,
                            style: textTheme.titleMedium!.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold)),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
