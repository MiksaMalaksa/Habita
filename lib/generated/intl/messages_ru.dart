// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(hintText) => "Некорректно введенное имя!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("Дополнительно"),
        "customization": MessageLookupByLibrary.simpleMessage("Кастомизация"),
        "dark": MessageLookupByLibrary.simpleMessage("Темная"),
        "email": MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "haveAccountMessage":
            MessageLookupByLibrary.simpleMessage("Уже существует аккаунт?"),
        "hintMissing": m0,
        "incorrectPassword": MessageLookupByLibrary.simpleMessage(
            "Длина пароля должна быть не меннее 6!"),
        "incorrectSigningUp":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так!"),
        "light": MessageLookupByLibrary.simpleMessage("Светлая"),
        "loginError": MessageLookupByLibrary.simpleMessage(
            "Такого аккаунта нет, попробуйте еще раз!"),
        "name": MessageLookupByLibrary.simpleMessage("Имя"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти!"),
        "signUp": MessageLookupByLibrary.simpleMessage("Регистрация!"),
        "submit": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "system": MessageLookupByLibrary.simpleMessage("Системная")
      };
}
