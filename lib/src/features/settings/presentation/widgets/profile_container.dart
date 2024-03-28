import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/container_button.dart';
import 'package:fluttericon/elusive_icons.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //*change it to exstension
            color: Theme.of(context)
                .scaffoldBackgroundColor
                .withBlue(Theme.of(context).scaffoldBackgroundColor.blue + 20)
                .withGreen(Theme.of(context).scaffoldBackgroundColor.green + 20)
                .withRed(Theme.of(context).scaffoldBackgroundColor.red + 20)
                .withOpacity(0.5)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Profile:',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ContainerButton(
                    icon: Elusive.pencil,
                    backcolor: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withBlue(
                            Theme.of(context).scaffoldBackgroundColor.blue + 35)
                        .withGreen(
                            Theme.of(context).scaffoldBackgroundColor.green +
                                35)
                        .withRed(
                            Theme.of(context).scaffoldBackgroundColor.red + 35)
                        .withOpacity(0.9),
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.person,
                  size: 85,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
