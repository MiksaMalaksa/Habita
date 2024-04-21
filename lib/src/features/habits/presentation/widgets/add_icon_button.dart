import 'package:flutter/material.dart';

class AddIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const AddIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 0.6,
            color: Theme.of(context).primaryColorLight,
          ),
          color: Theme.of(context)
              .primaryColorLight
              .withAlpha(150)
              .withOpacity(0.4),
        ),
        child: Center(
          child: Icon(
            icon,
            size: MediaQuery.of(context).size.height * 0.045,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
