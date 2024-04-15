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

  static String m0(value1, value2) => "${value1} из ${value2} сделаны!";

  static String m1(hintText) => "Некорректно введенное имя!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("Дополнительно"),
        "alertLogout": MessageLookupByLibrary.simpleMessage("Выход с аккаунта"),
        "almostDone": MessageLookupByLibrary.simpleMessage("Почти все!"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelCapitalized": MessageLookupByLibrary.simpleMessage("CANCEL"),
        "changeAvatar": MessageLookupByLibrary.simpleMessage("ПОМЕНЯТЬ АВАТАР"),
        "checkOldPassword": MessageLookupByLibrary.simpleMessage(
            "Надо подтвердить свой старый пароль!"),
        "colors": MessageLookupByLibrary.simpleMessage("Colors"),
        "completedOutOf": m0,
        "customization": MessageLookupByLibrary.simpleMessage("Кастомизация"),
        "dark": MessageLookupByLibrary.simpleMessage("Темная"),
        "email": MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "endDate": MessageLookupByLibrary.simpleMessage("End date"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Восстановить пароль"),
        "halfDone": MessageLookupByLibrary.simpleMessage("На пол пути!"),
        "haveAccountMessage":
            MessageLookupByLibrary.simpleMessage("Уже существует аккаунт?"),
        "hintMissing": m1,
        "home": MessageLookupByLibrary.simpleMessage("Главная"),
        "icons": MessageLookupByLibrary.simpleMessage("Icons"),
        "immutable": MessageLookupByLibrary.simpleMessage("Immutable"),
        "incorrectPassword": MessageLookupByLibrary.simpleMessage(
            "Длина пароля должна быть не меннее 6!"),
        "incorrectSigningUp":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так!"),
        "invalidEndDate":
            MessageLookupByLibrary.simpleMessage("Min days are 7 from today!"),
        "invalidInput": MessageLookupByLibrary.simpleMessage("Invalid input"),
        "invalidStartDate": MessageLookupByLibrary.simpleMessage(
            "You can  ot start before today :)"),
        "light": MessageLookupByLibrary.simpleMessage("Светлая"),
        "loginError": MessageLookupByLibrary.simpleMessage(
            "Такого аккаунта нет, попробуйте еще раз!"),
        "mutable": MessageLookupByLibrary.simpleMessage("Mutable"),
        "name": MessageLookupByLibrary.simpleMessage("Имя"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Новый пароль"),
        "no": MessageLookupByLibrary.simpleMessage("Нет"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
        "noConnection": MessageLookupByLibrary.simpleMessage(
            "Нет подключения к интернету!"),
        "noInternet": MessageLookupByLibrary.simpleMessage(
            "Проверьте ваше соединение с интернетом!"),
        "nothingDone":
            MessageLookupByLibrary.simpleMessage("Начните действовать!"),
        "oldPassword": MessageLookupByLibrary.simpleMessage("Старый пароль"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "profileEdited":
            MessageLookupByLibrary.simpleMessage("Профиль отредактирован!"),
        "program": MessageLookupByLibrary.simpleMessage("Программа"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "setNow": MessageLookupByLibrary.simpleMessage("Set now"),
        "settingsNoInternet": MessageLookupByLibrary.simpleMessage(
            "Приложение переходит в локальный режим, режим редактирования недоступен"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти!"),
        "signOut": MessageLookupByLibrary.simpleMessage("Выйти с аккаунта"),
        "signUp": MessageLookupByLibrary.simpleMessage("Регистрация!"),
        "somethingWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так!"),
        "sourceCode": MessageLookupByLibrary.simpleMessage("Код проекта"),
        "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
        "stats": MessageLookupByLibrary.simpleMessage("Статистика"),
        "submit": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "submitCapitalised": MessageLookupByLibrary.simpleMessage("SUBMIT"),
        "system": MessageLookupByLibrary.simpleMessage("Системная"),
        "telegram": MessageLookupByLibrary.simpleMessage("Написать мне"),
        "versus": MessageLookupByLibrary.simpleMessage("Против"),
        "wantToLogOut": MessageLookupByLibrary.simpleMessage(
            "Вы точно хотите выйти с аккаунта?"),
        "yes": MessageLookupByLibrary.simpleMessage("Да")
      };
}
