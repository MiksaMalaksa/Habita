import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/container_button.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/settings/presentation/screens/profile_edit_screen.dart';
import 'package:habita/src/features/settings/presentation/widgets/profile_picture.dart';
import 'package:habita/src/themes/app_theme_provider.dart';
import 'package:provider/provider.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentMode = Provider.of<ThemeProvider>(context).currentMode;
    return SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //*Border case of design
            color: currentMode == ThemeMode.dark ||
                    (currentMode == ThemeMode.system &&
                        MediaQuery.of(context).platformBrightness ==
                            Brightness.dark)
                ? Theme.of(context)
                    .scaffoldBackgroundColor
                    .elevateAllColors(upParam: 20, opacity: 0.5)
                : Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .elevateAllColors(upParam: 0, opacity: 0.9)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      S.of(context).profile,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const Spacer(),
                    ContainerButton(
                      icon: Elusive.pencil,
                      backcolor: Theme.of(context).primaryColorLight,
                      onPressed: () => Navigator.of(context).push(
                        EditProfile.route(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //!ON PRESSED
                ProfilePicture(
                  size: MediaQuery.of(context).size.height * 0.15,
                ),
                const SizedBox(
                  height: 15,
                ),
                //!Placeholders
                Center(
                  child: Text(
                    'Miksa',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    'malaxa2000@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: const Color.fromARGB(255, 99, 99, 99)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
