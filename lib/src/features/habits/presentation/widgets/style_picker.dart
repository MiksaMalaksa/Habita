import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';
import 'package:habita/src/features/habits/presentation/widgets/container_icon.dart';

final _habitIcons = [
  //!hobbies - 6
  FontAwesome5.book,
  FontAwesome5.laptop_code,
  FontAwesome5.briefcase,
  FontAwesome5.guitar,
  Icons.brush,
  FontAwesome5.piggy_bank,

  //!food-6
  Entypo.cup,
  FontAwesome5.egg,
  FontAwesome5.apple_alt,
  FontAwesome5.carrot,
  FontAwesome5.pepper_hot,
  FontAwesome5.hands_wash,

  //!prog-12
  FontAwesome5.spotify,
  FontAwesome5.telegram,
  FontAwesome5.twitter,
  FontAwesome5.google,
  FontAwesome5.youtube,
  FontAwesome5.linkedin,
  FontAwesome5.playstation,
  FontAwesome5.xbox,
  FontAwesome5.git,
  FontAwesome5.database,
  FontAwesome5.wifi,
  FontAwesome5.mobile_alt,

//!sport-health-12
  FontAwesome5.dumbbell,
  FontAwesome5.skating,
  FontAwesome5.skiing,
  FontAwesome5.swimmer,
  FontAwesome5.walking,
  FontAwesome5.running,
  FontAwesome5.bicycle,
  FontAwesome5.bed,
  FontAwesome5.football_ball,
  FontAwesome5.spa,
  FontAwesome5.heartbeat,
  FontAwesome5.tree,

  //!bad-6
  FontAwesome5.smoking,
  FontAwesome5.pizza_slice,
  FontAwesome5.wine_bottle,
  FontAwesome5.hamburger,
  FontAwesome5.gamepad,
  FontAwesome5.grimace,
];

const _habitIconColors = [
  Color.fromARGB(255, 138, 224, 140),
  Color.fromARGB(255, 113, 218, 107),
  Color.fromARGB(255, 217, 154, 108),
  Color.fromARGB(255, 218, 201, 107),
  Color.fromARGB(255, 212, 218, 107),
  Color.fromARGB(255, 218, 107, 107),
  Color.fromARGB(255, 218, 107, 159),
  Color.fromARGB(255, 218, 107, 216),
  Color.fromARGB(255, 193, 136, 213),
  Color.fromARGB(255, 96, 117, 192),
  Color.fromARGB(255, 107, 131, 218),
  Color.fromARGB(255, 107, 218, 211),
];

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  bool _colorPicker = false;
  Color _currentColor = _habitIconColors[0];
  IconData _currentIcon = _habitIcons[0];

  void _changePicker() {
    setState(() {
      _colorPicker = _colorPicker == false ? true : false;
    });
  }

  void _changeColor(Color newColor) {
    setState(() {
      _currentColor = newColor;
    });
  }

  void _changeIcon(IconData newIcon) {
    setState(() {
      _currentIcon = newIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headlineSmall;
    final currentList = _colorPicker ? _habitIconColors : _habitIcons;

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.51,
          decoration: BoxDecoration(
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 0.9,
                color: Theme.of(context).primaryColorLight.withOpacity(0.3),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: _changePicker,
                      child: Text(S.of(context).icons,
                          style: !_colorPicker
                              ? textTheme
                              : textTheme!.copyWith(
                                  color: Theme.of(context)
                                      .primaryColorLight
                                      .withOpacity(0.4),
                                )),
                    ),
                    TextButton(
                        onPressed: _changePicker,
                        child: Text(
                          S.of(context).colors,
                          style: _colorPicker
                              ? textTheme
                              : textTheme!.copyWith(
                                  color: Theme.of(context)
                                      .primaryColorLight
                                      .withOpacity(0.4),
                                ),
                        )),
                    const Spacer(),
                    ContainerShowCase(
                      backcolor: _currentColor,
                      icon: _currentIcon,
                      iconColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: double.infinity,
                height: 0.9,
                color: Theme.of(context).primaryColorLight.withOpacity(0.3),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _colorPicker ? 4 : 6,
                  ),
                  itemCount: currentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _colorPicker
                        ? GestureDetector(
                            onTap: () => _changeColor(_habitIconColors[index]),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _habitIconColors[index],
                                    border: Border.all(
                                        width: 1,
                                        color: _habitIconColors[index]
                                            .desaturate(0.9))),
                              ),
                            ),
                          )
                        : IconButton(
                            onPressed: () => _changeIcon(_habitIcons[index]),
                            icon: Icon(_habitIcons[index]),
                          );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(S.of(context).cancel),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(S.of(context).submit),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
