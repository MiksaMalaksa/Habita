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

  static String m0(value1, value2) => "${value1} z ${value2} připraveno!";

  static String m1(hintText) => "Nesprávně zadané jméno!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Účet"),
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("Další nastavení"),
        "alertLogout": MessageLookupByLibrary.simpleMessage("Odhlášení z účtu"),
        "almostDone": MessageLookupByLibrary.simpleMessage("Téměř všechny!"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changeAvatar": MessageLookupByLibrary.simpleMessage("ZMĚNIT AVATAR"),
        "checkOldPassword": MessageLookupByLibrary.simpleMessage(
            "Musíte potvrdit své staré heslo!"),
        "colors": MessageLookupByLibrary.simpleMessage("Colors"),
        "completedOutOf": m0,
        "customization": MessageLookupByLibrary.simpleMessage("Přizpůsobení"),
        "dark": MessageLookupByLibrary.simpleMessage("Temný"),
        "email": MessageLookupByLibrary.simpleMessage("E-mailem"),
        "forgetPassword": MessageLookupByLibrary.simpleMessage("Obnovit heslo"),
        "halfDone": MessageLookupByLibrary.simpleMessage("Na půli cesty!"),
        "haveAccountMessage":
            MessageLookupByLibrary.simpleMessage("Máte již účet?"),
        "hintMissing": m1,
        "home": MessageLookupByLibrary.simpleMessage("Úvod"),
        "icons": MessageLookupByLibrary.simpleMessage("Icons"),
        "incorrectPassword": MessageLookupByLibrary.simpleMessage(
            "Délka hesla musí být alespoň 6!  "),
        "incorrectSigningUp":
            MessageLookupByLibrary.simpleMessage("Něco se pokazilo"),
        "light": MessageLookupByLibrary.simpleMessage("Světlo"),
        "loginError": MessageLookupByLibrary.simpleMessage(
            "Takový účet neexistuje, zkuste to znovu!"),
        "name": MessageLookupByLibrary.simpleMessage("Jméno"),
        "no": MessageLookupByLibrary.simpleMessage("Ne"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Nemáte účet?"),
        "noConnection":
            MessageLookupByLibrary.simpleMessage("Žádné připojení k internetu"),
        "noInternet": MessageLookupByLibrary.simpleMessage(
            "Zkontrolujte připojení k internetu!"),
        "nothingDone":
            MessageLookupByLibrary.simpleMessage("Start taking action!"),
        "oldPassword": MessageLookupByLibrary.simpleMessage("Nové heslo"),
        "password": MessageLookupByLibrary.simpleMessage("Heslo"),
        "profile": MessageLookupByLibrary.simpleMessage("Profil"),
        "profileEdited":
            MessageLookupByLibrary.simpleMessage("Profil byl upraven!"),
        "program": MessageLookupByLibrary.simpleMessage("Program"),
        "save": MessageLookupByLibrary.simpleMessage("Uložit"),
        "settingsNoInternet": MessageLookupByLibrary.simpleMessage(
            "Aplikace přejde do místního režimu, režim úprav není k dispozici"),
        "signIn": MessageLookupByLibrary.simpleMessage("Přihlásit se!"),
        "signOut": MessageLookupByLibrary.simpleMessage("Odhlášení z účtu"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrace!"),
        "somethingWrong":
            MessageLookupByLibrary.simpleMessage("Něco se pokazilo!"),
        "sourceCode": MessageLookupByLibrary.simpleMessage("Source code"),
        "stats": MessageLookupByLibrary.simpleMessage("Statistiky"),
        "submit": MessageLookupByLibrary.simpleMessage("Potvrďte"),
        "system": MessageLookupByLibrary.simpleMessage("Systém"),
        "telegram": MessageLookupByLibrary.simpleMessage("Napište mi"),
        "versus": MessageLookupByLibrary.simpleMessage("Versus"),
        "wantToLogOut": MessageLookupByLibrary.simpleMessage(
            "Opravdu se chcete odhlásit ze svého účtu?"),
        "yes": MessageLookupByLibrary.simpleMessage("Ano")
      };
}
