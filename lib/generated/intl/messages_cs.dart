// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a cs locale. All the
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
  String get localeName => 'cs';

  static String m0(hintText) => "Nesprávně zadané jméno!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Účet"),
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("Další nastavení"),
        "customization": MessageLookupByLibrary.simpleMessage("Přizpůsobení"),
        "dark": MessageLookupByLibrary.simpleMessage("Temný"),
        "email": MessageLookupByLibrary.simpleMessage("E-mailem"),
        "haveAccountMessage":
            MessageLookupByLibrary.simpleMessage("Máte již účet?"),
        "hintMissing": m0,
        "incorrectPassword": MessageLookupByLibrary.simpleMessage(
            "Délka hesla musí být alespoň 6!  "),
        "incorrectSigningUp":
            MessageLookupByLibrary.simpleMessage("Něco se pokazilo"),
        "light": MessageLookupByLibrary.simpleMessage("Světlo"),
        "loginError": MessageLookupByLibrary.simpleMessage(
            "Takový účet neexistuje, zkuste to znovu!"),
        "name": MessageLookupByLibrary.simpleMessage("Jméno"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Nemáte účet?"),
        "password": MessageLookupByLibrary.simpleMessage("Heslo"),
        "profile": MessageLookupByLibrary.simpleMessage("Profil"),
        "save": MessageLookupByLibrary.simpleMessage("Uložit"),
        "signIn": MessageLookupByLibrary.simpleMessage("Přihlásit se!"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrace!"),
        "sourceCode": MessageLookupByLibrary.simpleMessage("Source code"),
        "submit": MessageLookupByLibrary.simpleMessage("Potvrďte"),
        "system": MessageLookupByLibrary.simpleMessage("Systém"),
        "telegram": MessageLookupByLibrary.simpleMessage("Napište mi")
      };
}
