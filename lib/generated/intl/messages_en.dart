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

  static String m0(hintText) => "${hintText} is missing!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("Additional settings"),
        "customization": MessageLookupByLibrary.simpleMessage("Customization"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "haveAccountMessage":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "hintMissing": m0,
        "incorrectPassword": MessageLookupByLibrary.simpleMessage(
            "Password can not be less then 6!"),
        "incorrectSigningUp":
            MessageLookupByLibrary.simpleMessage("Something went wrong!"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "loginError":
            MessageLookupByLibrary.simpleMessage("No such account, try again!"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "noAccount":
            MessageLookupByLibrary.simpleMessage("Do not have an account?"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In!"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up!"),
        "sourceCode": MessageLookupByLibrary.simpleMessage("Source code"),
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "telegram": MessageLookupByLibrary.simpleMessage("Text me")
      };
}
