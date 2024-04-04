import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/common/widgets/container_button_row_icon.dart';
import 'package:habita/core/common/widgets/loader.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:habita/src/features/settings/presentation/widgets/profile_edit_widgets/change_password.dart';
import 'package:habita/src/features/settings/presentation/widgets/profile_edit_widgets/change_text_field.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/profile_picture.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/entypo_icons.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();

  static route() =>
      MaterialPageRoute(builder: (context) => const EditProfile());
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentState = BlocProvider.of<SettingsBloc>(context).state;
    final textStyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context)
              .primaryColorLight
              .elevateAllColors(upParam: -60),
        );
    switch (currentState) {
      //!remove later
      case SettingsInitial():
        return const Loader();
      case SettingsLoaded state:
        return Scaffold(
          appBar: HabitaAppBar(
            title: S.of(context).account,
            actions: [
              HabitaTextButton(
                onPressed: () {
                  ////*Check does oldPassword setted right by user////
                  if (formKey.currentState!.validate()) {
                    if (newPasswordController.text.isNotEmpty &&
                        oldPasswordController.text.isEmpty) {
                          showSnackBar(context: context, content: 'Before changing password need to confirm previous one');
                    } else {
                      context.read<SettingsBloc>().add(SettingsUpdateUser(
                            currentUser: state.user,
                            email: emailController.text,
                            name: nameController.text,
                            password: newPasswordController.text,
                          ));
                    }
                  }
                },
                title: S.of(context).save,
                fontSize: MediaQuery.of(context).size.height * 0.023,
                weight: FontWeight.bold,
              )
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //!Replace it later with widget with nothing and pofile
                    Center(
                      child: ProfilePicture(
                          size: MediaQuery.of(context).size.height * 0.15),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: HabitaTextButton(
                        onPressed: () {
                          //!Set the photo
                        },
                        title: S.of(context).changeAvatar,
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                        weight: FontWeight.bold,
                      ),
                    ),
                    //*fields
                    const SizedBox(height: 10),
                    Text(
                      S.of(context).name,
                      style: textStyle,
                    ),
                    const SizedBox(height: 6),

                    ///*Name field
                    ChangeTextField(
                      controller: nameController,
                      hintText: state.user.name,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      S.of(context).email,
                      style: textStyle,
                    ),
                    const SizedBox(height: 6),

                    ///*Email field
                    ChangeTextField(
                      controller: emailController,
                      hintText: state.user.email,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      S.of(context).oldPassword,
                      style: textStyle,
                    ),
                    //*old password
                    const SizedBox(height: 6),
                    ChangePasswordField(
                      controller: oldPasswordController,
                      hintText: '********',
                    ),
                    const SizedBox(height: 12),
                    Text(
                      S.of(context).newPassword,
                      style: textStyle,
                    ),
                    //*new password
                    const SizedBox(height: 6),
                    ChangePasswordField(
                      controller: newPasswordController,
                      hintText: S.of(context).password,
                    ),
                    const SizedBox(height: 30),
                    //*Forget password
                    ContainerButtonRowIcon(
                      backColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      content: S.of(context).forgetPassword,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      onPressed: () {},
                      icon: Entypo.key,
                    ),
                    //*Sign out
                    const SizedBox(height: 15),
                    ContainerButtonRowIcon(
                      backColor: Theme.of(context).colorScheme.errorContainer,
                      content: S.of(context).signOut,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      onPressed: () {
                        context.read<SettingsBloc>().add(SettingsUserSignOut());
                      },
                      icon: FontAwesome5.sign_out_alt,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      case SettingsError state:
        //showSnackBar(context: context, content: state.errorMessage);
        return const Placeholder();
    }
  }
}
