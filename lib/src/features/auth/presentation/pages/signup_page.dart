import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/widgets/loader.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/auth/presentation/pages/login_page.dart';
import 'package:habita/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:habita/src/features/auth/presentation/widgets/auth_field.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                showSnackBar(context: context, content: state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is AuthProcessing) {
                const Loader();
              }
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).signUp,
                        style: textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 40),
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
                        page: 'signUp',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthSignUp(
                                  name: nameTextController.text,
                                  email: emailTextController.text,
                                  password: passwordTextController.text,
                                ));
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                            text: S.of(context).haveAccountMessage,
                            style: textTheme.titleMedium,
                            children: [
                              TextSpan(
                                  text: " ${S.of(context).signIn}",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.of(context)
                                        .push(LoginPage.route()),
                                  style: textTheme.titleMedium!.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold)),
                            ]),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
