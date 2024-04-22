import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/core/common/widgets/container_button.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/settings/presentation/screens/profile_edit_screen.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/profile_picture.dart';
import 'package:habita/src/themes/bloc/theme_bloc.dart';

class ProfileContainer extends StatelessWidget {
  final String name;
  final String email;
  const ProfileContainer({
    super.key,
    required this.name,
    required this.email,
  });

  Future<void> _showPicture(
    BuildContext context,
  ) {
    return showDialog(
        context: context,
        builder: (context) => Dialog.fullscreen(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.05),
              child: Center(
                child: ProfilePicture(
                    size: MediaQuery.of(context).size.height * 0.3),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final themeState = BlocProvider.of<ThemeBloc>(context).state;
    return SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //*Border case of design
            color: themeState.currentMode == ThemeMode.dark ||
                    (themeState.currentMode == ThemeMode.system &&
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
                      backcolor: Theme.of(context)
                          .primaryColorLight
                          .desaturate(0.1)
                          .withOpacity(0.8),
                      iconColor: Colors.white,
                      onPressed: () => Navigator.of(context).push(
                        EditProfile.route(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //*Picture
                ProfilePicture(
                  size: MediaQuery.of(context).size.height * 0.15,
                  onPressed: (path) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    email,
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
