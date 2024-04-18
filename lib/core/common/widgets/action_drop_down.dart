import 'package:flutter/material.dart';

class ActionDropDown extends StatelessWidget {
  final String entrie;
  final IconData icon;
  final VoidCallback onPressed;
  final VoidCallback onHold;
  final Color? color;
  const ActionDropDown({
    super.key,
    required this.entrie,
    required this.onPressed,
    required this.icon,
    required this.onHold,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleMedium;
    return InkWell(
      onTap: onPressed,
      onLongPress: onHold,
      splashColor: Theme.of(context).splashColor,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: Theme.of(context).primaryColorLight.withOpacity(0.7),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Text(
              entrie,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: color ?? textTheme!.color),
            ),
            const Spacer(),
            Icon(icon),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
