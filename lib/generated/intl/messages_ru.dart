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

  static String m2(maxValue) => "Макс - ${maxValue}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("Дополнительно"),
        "alertLogout": MessageLookupByLibrary.simpleMessage("Выход с аккаунта"),
        "almostDone": MessageLookupByLibrary.simpleMessage("Почти все!"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "cancelCapitalized": MessageLookupByLibrary.simpleMessage("ОТМЕНИТЬ"),
        "change": MessageLookupByLibrary.simpleMessage("Изменить"),
        "changeAvatar": MessageLookupByLibrary.simpleMessage("ПОМЕНЯТЬ АВАТАР"),
        "checkOldPassword": MessageLookupByLibrary.simpleMessage(
            "Надо подтвердить свой старый пароль!"),
        "colors": MessageLookupByLibrary.simpleMessage("Цвета"),
        "completedOutOf": m0,
        "create": MessageLookupByLibrary.simpleMessage("Создать"),
        "customization": MessageLookupByLibrary.simpleMessage("Кастомизация"),
        "dark": MessageLookupByLibrary.simpleMessage("Темная"),
        "description": MessageLookupByLibrary.simpleMessage("Описание"),
        "email": MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "endDate": MessageLookupByLibrary.simpleMessage("Конец"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Восстановить пароль"),
        "friday": MessageLookupByLibrary.simpleMessage("Friday"),
        "habitDays": MessageLookupByLibrary.simpleMessage("Habit days"),
        "habitName": MessageLookupByLibrary.simpleMessage("Привычка"),
        "habitType": MessageLookupByLibrary.simpleMessage("Тип привычки"),
        "halfDone": MessageLookupByLibrary.simpleMessage("На пол пути!"),
        "haveAccountMessage":
            MessageLookupByLibrary.simpleMessage("Уже существует аккаунт?"),
        "hintMissing": m1,
        "home": MessageLookupByLibrary.simpleMessage("Главная"),
        "icons": MessageLookupByLibrary.simpleMessage("Иконки"),
        "immutable": MessageLookupByLibrary.simpleMessage("Неизменяемая"),
        "incorrectPassword": MessageLookupByLibrary.simpleMessage(
            "Длина пароля должна быть не меннее 6!"),
        "incorrectSigningUp":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так!"),
        "invalidEndDate": MessageLookupByLibrary.simpleMessage(
            "Минимальное - 7 дней с сегодня!"),
        "invalidInput":
            MessageLookupByLibrary.simpleMessage("Некорректный ввод"),
        "invalidStartDate": MessageLookupByLibrary.simpleMessage(
            "Вы не можете начать вчера :)"),
        "light": MessageLookupByLibrary.simpleMessage("Светлая"),
        "loginError": MessageLookupByLibrary.simpleMessage(
            "Такого аккаунта нет, попробуйте еще раз!"),
        "maxValue": m2,
        "monday": MessageLookupByLibrary.simpleMessage("Monday"),
        "multiple": MessageLookupByLibrary.simpleMessage("Множественное ту-ду"),
        "mutable": MessageLookupByLibrary.simpleMessage("Изменяемая"),
        "name": MessageLookupByLibrary.simpleMessage("Имя"),
        "nameOfHabit":
            MessageLookupByLibrary.simpleMessage("Название привычки"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Новый пароль"),
        "no": MessageLookupByLibrary.simpleMessage("Нет"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
        "noConnection": MessageLookupByLibrary.simpleMessage(
            "Нет подключения к интернету!"),
        "noInternet": MessageLookupByLibrary.simpleMessage(
            "Проверьте ваше соединение с интернетом!"),
        "notes": MessageLookupByLibrary.simpleMessage("Заметки"),
        "nothingDone":
            MessageLookupByLibrary.simpleMessage("Начните действовать!"),
        "off": MessageLookupByLibrary.simpleMessage("без напоминания"),
        "oldPassword": MessageLookupByLibrary.simpleMessage("Старый пароль"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "profileEdited":
            MessageLookupByLibrary.simpleMessage("Профиль отредактирован!"),
        "program": MessageLookupByLibrary.simpleMessage("Программа"),
        "saturday": MessageLookupByLibrary.simpleMessage("Saturday"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "setNow": MessageLookupByLibrary.simpleMessage("Установить"),
        "setReminder":
            MessageLookupByLibrary.simpleMessage("Установить напоминание"),
        "settingsNoInternet": MessageLookupByLibrary.simpleMessage(
            "Приложение переходит в локальный режим, режим редактирования недоступен"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти!"),
        "signOut": MessageLookupByLibrary.simpleMessage("Выйти с аккаунта"),
        "signUp": MessageLookupByLibrary.simpleMessage("Регистрация!"),
        "smallDescription":
            MessageLookupByLibrary.simpleMessage("Описание привычки"),
        "somethingWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так!"),
        "sourceCode": MessageLookupByLibrary.simpleMessage("Код проекта"),
        "startDate": MessageLookupByLibrary.simpleMessage("Старт"),
        "stats": MessageLookupByLibrary.simpleMessage("Статистика"),
        "steps": MessageLookupByLibrary.simpleMessage("Шаги"),
        "submit": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "submitCapitalised":
            MessageLookupByLibrary.simpleMessage("ПОДТВЕРДИТЬ"),
        "sunday": MessageLookupByLibrary.simpleMessage("Sunday"),
        "system": MessageLookupByLibrary.simpleMessage("Системная"),
        "telegram": MessageLookupByLibrary.simpleMessage("Написать мне"),
        "thursday": MessageLookupByLibrary.simpleMessage("Thursday"),
        "todo": MessageLookupByLibrary.simpleMessage("Ту-ду"),
        "tuesday": MessageLookupByLibrary.simpleMessage("Tuesday"),
        "versus": MessageLookupByLibrary.simpleMessage("Против"),
        "wantToLogOut": MessageLookupByLibrary.simpleMessage(
            "Вы точно хотите выйти с аккаунта?"),
        "water": MessageLookupByLibrary.simpleMessage("Вода"),
        "wednesday": MessageLookupByLibrary.simpleMessage("Wednesday"),
        "yes": MessageLookupByLibrary.simpleMessage("Да")
      };
}
