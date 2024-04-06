import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/blocs/bloc/internetconnection_bloc.dart';
import 'package:habita/core/common/widgets/habita_greet.dart';
import 'package:habita/core/common/widgets/loader.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/page_manager.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/auth/presentation/pages/signup_page.dart';
import 'package:habita/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:habita/src/features/auth/presentation/widgets/auth_field.dart';
import 'package:habita/src/features/auth/presentation/widgets/auth_password_field.dart';

class LoginPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const LoginPage());

  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    void formValidation() {
      if (formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(AuthSignIn(
              email: emailTextController.text,
              password: passwordTextController.text,
            ));
      }
    }

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showSnackBar(context: context, content: S.of(context).loginError);
          } else if (state is AuthLoaded) {
            Navigator.of(context)
                .pushAndRemoveUntil(PageManager.route(), (route) => false);
          }
        },
        builder: (context, state) => Center(
          child: state is AuthProcessing
              ? const Loader()
              : state is AuthGreet
                  ? const HabitaGreet()
                  : state is AuthProcessing
                      ? const Loader()
                      //*Crucial cuz otherwise login screen will be shown
                      //*For a small time
                      : state is AuthLoaded
                          ? Container()
                          : BlocBuilder<InternetConnectionBloc,
                              InternetConnectionState>(
                              builder: (context, state) {

                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Form(
                                    key: formKey,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            S.of(context).signIn,
                                            style: textTheme.headlineMedium!
                                                .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 40),
                                          ),
                                          const SizedBox(height: 22),
                                          AuthField(
                                            hintText: S.of(context).email,
                                            icon: Icons.email,
                                            controller: emailTextController,
                                          ),
                                          const SizedBox(height: 17),
                                          PasswordField(
                                            controller: passwordTextController,
                                            hintText: S.of(context).password,
                                            icon: Icons.password,
                                          ),
                                          const SizedBox(height: 20),
                                          AuthButton(
                                            showColors: state.isConnected,
                                            onTap: () => state.isConnected
                                                ? formValidation
                                                : showSnackBar(
                                                    content: S
                                                        .of(context)
                                                        .noConnection,
                                                    context: context),
                                          ),
                                          const SizedBox(height: 20),
                                          RichText(
                                            text: TextSpan(
                                              text: S.of(context).noAccount,
                                              style: textTheme.titleMedium,
                                              children: [
                                                TextSpan(
                                                  text:
                                                      " ${S.of(context).signUp}",
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () =>
                                                            Navigator.of(
                                                                    context)
                                                                .push(SignUpPage
                                                                    .route()),
                                                  style: textTheme.titleMedium!
                                                      .copyWith(
                                                    color: theme
                                                        .colorScheme.primary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
