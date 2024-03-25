import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:habita/src/features/auth/presentation/widgets/auth_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpPage> {
  final emailTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  void dispose() {
    emailTextController.dispose();
    nameTextController.dispose();
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
                  S.of(context).signUp,
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
                  hintText: S.of(context).name,
                  icon: Icons.person,
                  controller: nameTextController,
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
                      text: S.of(context).haveAccountMessage,
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
