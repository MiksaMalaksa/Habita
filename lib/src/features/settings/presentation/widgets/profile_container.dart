import 'package:flutter/material.dart';
import 'package:habita/core/common/widgets/container_button.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:habita/core/extensions/color_rgb.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).scaffoldBackgroundColor.elevateAllColors(
                  upParam: 20,
                  opacity: 0.5,
                )),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Profile:',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const Spacer(),
                    ContainerButton(
                      icon: Elusive.pencil,
                      backcolor: Theme.of(context)
                          .scaffoldBackgroundColor
                          .elevateAllColors(
                            upParam: 35,
                            opacity: 0.9,
                          ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                //!This icon will be replaced with custom widget of inkwell
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.person,
                    size: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //!Placeholders
                Center(
                  child: Text(
                    'Miksa',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
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
