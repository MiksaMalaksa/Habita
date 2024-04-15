import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

const minProgramDuration = 7;

const _dayTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w700,
);

CalendarDatePicker2WithActionButtonsConfig getStartConfig(
        BuildContext context) =>
    CalendarDatePicker2WithActionButtonsConfig(
      calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
      dayTextStyle: _dayTextStyle,
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: Theme.of(context).primaryColor,
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      yearTextStyle: const TextStyle(color: Colors.black),
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: _dayTextStyle.copyWith(color: Colors.white),
      gapBetweenCalendarAndButtons: 0,
      cancelButtonTextStyle:
          Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).primaryColorDark.withAlpha(200),
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
      okButtonTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).primaryColorDark.withAlpha(200),
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.isBefore(DateTime.now()) || date.day == DateTime.now().day) {
          textStyle = const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          );
        }
        if ((date.weekday == DateTime.saturday ||
                date.weekday == DateTime.sunday) &&
            !date.isBefore(DateTime.now())) {
          textStyle = TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.bold,
          );
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: year < DateTime.now().year
                          ? const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500)
                          : textStyle!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

CalendarDatePicker2WithActionButtonsConfig getEndConfig(BuildContext context) =>
    CalendarDatePicker2WithActionButtonsConfig(
      calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
      dayTextStyle: _dayTextStyle,
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: Theme.of(context).primaryColor,
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      yearTextStyle: const TextStyle(color: Colors.black),
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: _dayTextStyle.copyWith(color: Colors.white),
      gapBetweenCalendarAndButtons: 0,
      cancelButtonTextStyle:
          Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).primaryColorDark.withAlpha(200),
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
      okButtonTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).primaryColorDark.withAlpha(200),
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.isBefore(DateTime.now().add(const Duration(days: minProgramDuration)))) {
          textStyle = const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          );
        }
        if ((date.weekday == DateTime.saturday ||
                date.weekday == DateTime.sunday) &&
            !date.isBefore(DateTime.now().add(const Duration(days: minProgramDuration)))) {
          textStyle = TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.bold,
          );
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: year < DateTime.now().add(const Duration(days: minProgramDuration)).year
                          ? const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500)
                          : textStyle!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
