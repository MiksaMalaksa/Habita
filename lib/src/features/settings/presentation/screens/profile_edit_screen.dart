import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/common/widgets/container_button_row_icon.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
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
    final textStyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Theme.of(context)
              .primaryColorLight
              .elevateAllColors(upParam: -60),
        );
    return Scaffold(
      appBar: HabitaAppBar(
        title: S.of(context).account,
        actions: [
          HabitaTextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                //!change properties usecase
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
                ChangeTextField(
                  controller: nameController,
                  hintText: S.of(context).name,
                ),
                const SizedBox(height: 12),
                Text(
                  S.of(context).email,
                  style: textStyle,
                ),
                const SizedBox(height: 6),
                ChangeTextField(
                  controller: emailController,
                  hintText: S.of(context).email,
                ),
                const SizedBox(height: 12),
                Text(
                  S.of(context).oldPassword,
                  style: textStyle,
                ),
                const SizedBox(height: 6),
                ChangeTextField(
                  controller: oldPasswordController,
                  hintText: '********',
                ),
                const SizedBox(height: 12),
                Text(
                  S.of(context).newPassword,
                  style: textStyle,
                ),
                const SizedBox(height: 6),
                ChangeTextField(
                  controller: newPasswordController,
                  hintText: S.of(context).password,
                ),
                const SizedBox(height: 30),
                //*Forget password
                ContainerButtonRowIcon(
                  backColor: Theme.of(context).colorScheme.secondaryContainer,
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
                  onPressed: () {},
                  icon: FontAwesome5.sign_out_alt,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
