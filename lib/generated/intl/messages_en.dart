// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(value1, value2) => "${value1} of ${value2} completed";

  static String m1(hintText) => "${hintText} is missing!";

  static String m2(maxValue) => "Max - ${maxValue}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("Additional settings"),
        "alertLogout": MessageLookupByLibrary.simpleMessage("Loggin out"),
        "almostDone": MessageLookupByLibrary.simpleMessage("Almost Done!"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelCapitalized": MessageLookupByLibrary.simpleMessage("CANCEL"),
        "change": MessageLookupByLibrary.simpleMessage("Change"),
        "changeAvatar": MessageLookupByLibrary.simpleMessage("CHANGE AVATAR"),
        "checkOldPassword": MessageLookupByLibrary.simpleMessage(
            "Confirm old password befor submitting!"),
        "colors": MessageLookupByLibrary.simpleMessage("Colors"),
        "completedOutOf": m0,
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "customization": MessageLookupByLibrary.simpleMessage("Customization"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "endDate": MessageLookupByLibrary.simpleMessage("End date"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Restore password"),
        "friday": MessageLookupByLibrary.simpleMessage("Friday"),
        "habitDays": MessageLookupByLibrary.simpleMessage("Habit days"),
        "habitName": MessageLookupByLibrary.simpleMessage("Habit name"),
        "habitType": MessageLookupByLibrary.simpleMessage("Type of habit"),
        "halfDone": MessageLookupByLibrary.simpleMessage("Half Way Through!"),
        "haveAccountMessage":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "hintMissing": m1,
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "icons": MessageLookupByLibrary.simpleMessage("Icons"),
        "immutable": MessageLookupByLibrary.simpleMessage("Immutable"),
        "incorrectPassword": MessageLookupByLibrary.simpleMessage(
            "Password can not be less then 6!"),
        "incorrectSigningUp":
            MessageLookupByLibrary.simpleMessage("Something went wrong!"),
        "invalidEndDate":
            MessageLookupByLibrary.simpleMessage("Min days are 7 from today!"),
        "invalidInput": MessageLookupByLibrary.simpleMessage("Invalid input"),
        "invalidStartDate": MessageLookupByLibrary.simpleMessage(
            "You can not start before today :)"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "loginError":
            MessageLookupByLibrary.simpleMessage("No such account, try again!"),
        "maxValue": m2,
        "monday": MessageLookupByLibrary.simpleMessage("Monday"),
        "multiple": MessageLookupByLibrary.simpleMessage("Multiple to-do"),
        "mutable": MessageLookupByLibrary.simpleMessage("Mutable"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameOfHabit":
            MessageLookupByLibrary.simpleMessage("The name of habit"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noAccount":
            MessageLookupByLibrary.simpleMessage("Do not have an account?"),
        "noConnection":
            MessageLookupByLibrary.simpleMessage("No internet connection!"),
        "noInternet": MessageLookupByLibrary.simpleMessage(
            "Check your internet connection!"),
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
        "nothingDone":
            MessageLookupByLibrary.simpleMessage("Start taking actions!"),
        "off": MessageLookupByLibrary.simpleMessage("off"),
        "oldPassword": MessageLookupByLibrary.simpleMessage("Old password"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "profileEdited":
            MessageLookupByLibrary.simpleMessage("Profile edited!"),
        "program": MessageLookupByLibrary.simpleMessage("Program"),
        "saturday": MessageLookupByLibrary.simpleMessage("Saturday"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "setNow": MessageLookupByLibrary.simpleMessage("Set now"),
        "setReminder": MessageLookupByLibrary.simpleMessage("Set reminder"),
        "settingsNoInternet": MessageLookupByLibrary.simpleMessage(
            "The application goes into local mode, editing mode is not available"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In!"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sign out"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up!"),
        "smallDescription":
            MessageLookupByLibrary.simpleMessage("Small description"),
        "somethingWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong!"),
        "sourceCode": MessageLookupByLibrary.simpleMessage("Source code"),
        "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
        "stats": MessageLookupByLibrary.simpleMessage("Stats"),
        "steps": MessageLookupByLibrary.simpleMessage("Steps"),
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "submitCapitalised": MessageLookupByLibrary.simpleMessage("SUBMIT"),
        "sunday": MessageLookupByLibrary.simpleMessage("Sunday"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "telegram": MessageLookupByLibrary.simpleMessage("Text me"),
        "thursday": MessageLookupByLibrary.simpleMessage("Thursday"),
        "todo": MessageLookupByLibrary.simpleMessage("To-do"),
        "tuesday": MessageLookupByLibrary.simpleMessage("Tuesday"),
        "versus": MessageLookupByLibrary.simpleMessage("Versus"),
        "wantToLogOut": MessageLookupByLibrary.simpleMessage(
            "Do you really want to log out?"),
        "water": MessageLookupByLibrary.simpleMessage("Water"),
        "wednesday": MessageLookupByLibrary.simpleMessage("Wednesday"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
