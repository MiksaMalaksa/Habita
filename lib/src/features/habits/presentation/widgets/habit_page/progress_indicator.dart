import 'package:flutter/material.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';

class HabitProgressContainer extends StatelessWidget {
  const HabitProgressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //!Place holders
    const value1 = 2;
    const value2 = 5;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: RadialGradient(
          colors: [
            Theme.of(context).primaryColorLight.withAlpha(200).withOpacity(0.7),
            Theme.of(context).primaryColorDark.withOpacity(0.8).desaturate(0.1),
          ],
          center: const Alignment(-0.8, -0.3),
          radius: 1.6,
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10,
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Image.asset(
              'assets/dart.png',
              width: MediaQuery.of(context).size.width * 0.22,
              height: MediaQuery.of(context).size.width * 0.22,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.016,
                top: MediaQuery.of(context).size.height * 0.016,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!Text placeholder
                  Text(
                    S.of(context).nothingDone,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                  ),
                  Text(
                    S.of(context).completedOutOf(value1, value2),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white.desaturate(0.8).withOpacity(0.5),
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: LinearProgressIndicator(
                      minHeight: MediaQuery.of(context).size.height * 0.01,
                      borderRadius: BorderRadius.circular(10),
                      //!change
                      value: value1 / value2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .desaturate(0.5)
                            .withOpacity(0.7),
                      ),
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.415,
                      ),
                      Text(
                        '${value1 / value2 * 100}%',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
