import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/blocs/bloc/internetconnection_bloc.dart';
import 'package:habita/core/common/entities/dialog.dart';
import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/common/widgets/container_button_row_icon.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/constants/exceptions_messages.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/core/utils/show_dialog.dart';
import 'package:habita/core/utils/show_snackbar.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/auth/presentation/pages/login_page.dart';
import 'package:habita/src/features/settings/presentation/widgets/profile_edit_widgets/change_password.dart';
import 'package:habita/src/features/settings/presentation/widgets/profile_edit_widgets/change_text_field.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/profile_picture.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final String? initialPath;
  const EditProfile({super.key, this.initialPath});

  @override
  State<EditProfile> createState() => _EditProfileState();

  static route(String? initialPath) => MaterialPageRoute(
      builder: (context) => EditProfile(
            initialPath: initialPath,
          ));
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  XFile? selectedImage;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  Future<void> _pickPicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null && mounted) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = BlocProvider.of<AuthBloc>(context).state;
    final textStyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context)
              .primaryColorLight
              .elevateAllColors(upParam: -60),
        );

    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showSnackBar(
              context: context,
              content: ErrorsConventer()
                  .convertedMsg(context, msg: state.errorMessage),
            );
          }
          if (state is AuthInitial) {
            Navigator.of(context)
                .pushAndRemoveUntil(LoginPage.route(), (route) => false);
          }
          if (state is AuthUpdated) {
            nameController.clear();
            emailController.clear();
            oldPasswordController.clear();
            newPasswordController.clear();
            showSnackBar(
              context: context,
              content: S.of(context).profileEdited,
            );
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          appBar: HabitaAppBar(
            title: S.of(context).account,
            actions: [
              HabitaTextButton(
                onPressed: () {
                  if (!BlocProvider.of<InternetConnectionBloc>(context)
                      .state
                      .isConnected) {
                    dialogBuilder(
                        context: context,
                        atributes: DialogAtributes(
                            label: S.of(context).noConnection,
                            body: S.of(context).settingsNoInternet));
                  } else if (formKey.currentState!.validate()) {
                    if (newPasswordController.text.isNotEmpty &&
                        oldPasswordController.text.isEmpty) {
                      showSnackBar(
                          context: context,
                          content: S.of(context).checkOldPassword);
                    } else {
                      if (selectedImage == null &&
                          oldPasswordController.text.isEmpty &&
                          emailController.text.isEmpty &&
                          newPasswordController.text.isEmpty) {
                        Navigator.of(context).pop();
                      }
                      context.read<AuthBloc>().add(
                            AuthUpdateUser(
                                oldPassword: oldPasswordController.text.isEmpty
                                    ? null
                                    : oldPasswordController.text,
                                email: emailController.text.isEmpty
                                    ? null
                                    : emailController.text,
                                name: nameController.text.isEmpty
                                    ? null
                                    : nameController.text,
                                password: newPasswordController.text.isEmpty
                                    ? null
                                    : newPasswordController.text,
                                imagePath: selectedImage?.path,
                                imageFile: selectedImage == null
                                    ? null
                                    : File(selectedImage!.path)),
                          );
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
                    Center(
                      child: ProfilePicture(
                        image:
                            selectedImage == null && widget.initialPath == null
                                ? null
                                : widget.initialPath != null
                                    ? File(widget.initialPath!)
                                    : File(selectedImage!.path),
                        size: MediaQuery.of(context).size.height * 0.15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: HabitaTextButton(
                        onPressed: () => _pickPicture(),
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
                      hintText: userState.user?.name ?? '',
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
                      hintText: userState.user?.email ?? '',
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
                    //*Delete account
                    ContainerButtonRowIcon(
                      backColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      content: S.of(context).deleteAccount,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      onPressed: () {
                        context.read<AuthBloc>().add(DeleteUserEvent());
                      },
                      icon: FontAwesome5.trash,
                      iconSize: MediaQuery.of(context).size.width * 0.07,
                    ),
                    //*Sign out
                    const SizedBox(height: 15),
                    ContainerButtonRowIcon(
                      backColor: const Color.fromARGB(255, 201, 78, 69),
                      content: S.of(context).signOut,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthSignOut());
                      },
                      icon: FontAwesome5.sign_out_alt,
                      iconSize: MediaQuery.of(context).size.width * 0.07,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
