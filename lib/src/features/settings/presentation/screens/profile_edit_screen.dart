import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/app_bar.dart';
import 'package:habita/core/common/widgets/text_button.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/settings/presentation/widgets/profile_picture.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();

  static route() =>
      MaterialPageRoute(builder: (context) => const EditProfile());
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitaAppBar(
        title: S.of(context).account,
        actions: [
          HabitaTextButton(
            onPressed: () {},
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //!Replace it later with widget with nothing and pofile
              Center(
                child: ProfilePicture(
                    size: MediaQuery.of(context).size.height * 0.15),
              ),
              const SizedBox(height: 8),
              HabitaTextButton(
                onPressed: () {},
                title: 'CHANGE AVATAR',
                fontSize: MediaQuery.of(context).size.height * 0.020,
                weight: FontWeight.bold,
              ),
              //*fields
              const SizedBox(height: 10),
              Text(S.of(context).name, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color:  Theme.of(context).primaryColorLight.elevateAllColors(upParam: -60)),),
            ],
          ),
        ),
      ),
    );
  }
}
