import 'package:flutter/material.dart';
import 'package:habita/core/enums/habit_type.dart';
import 'package:habita/core/extensions/color_rgb.dart';
import 'package:habita/generated/l10n.dart';

class TypeManager extends StatelessWidget {
  final HabitType type;
  final IconData icon;
  final TextEditingController controller;
  final String text;
  final int maxValue;
  final int maxLength;
  const TypeManager({
    super.key,
    required this.type,
    required this.icon,
    required this.text,
    required this.maxLength,
    required this.controller,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    return type == HabitType.todo
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color:
                          Theme.of(context).primaryColorLight.desaturate(0.9),
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.006,
                ),
                child: TextFormField(
                  controller: controller,
                  maxLength: maxLength,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: IconButton(
                        icon: Icon(
                          icon,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        onPressed: () => controller.clear(),
                      ),
                    ),
                    hintText: text,
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.trim().isEmpty) {
                      return S.of(context).invalidInput;
                    } else if (int.tryParse(value) == null) {
                      return S.of(context).shouldNumeric;
                    } else if (int.tryParse(value)! <= 0 ||
                        int.tryParse(value)! >= maxValue) {
                      return S.of(context).invalidInput;
                    }
                    return null;
                  },
                ),
              ),
            ],
          );
  }
}
