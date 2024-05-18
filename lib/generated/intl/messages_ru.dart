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
        "aim": MessageLookupByLibrary.simpleMessage("Цель"),
        "aimOfTheProgram":
            MessageLookupByLibrary.simpleMessage("Цель программы"),
        "alertLogout": MessageLookupByLibrary.simpleMessage("Выход с аккаунта"),
        "all": MessageLookupByLibrary.simpleMessage("Все"),
        "almostDone": MessageLookupByLibrary.simpleMessage("Почти все!"),
        "atLeast1Habit": MessageLookupByLibrary.simpleMessage(
            "Должна быть хотя-бы 1 привычка!"),
        "atLeast7Days": MessageLookupByLibrary.simpleMessage(
            "Программа должна длиться хотя-бы 7 дней!"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "cancelCapitalized": MessageLookupByLibrary.simpleMessage("ОТМЕНИТЬ"),
        "change": MessageLookupByLibrary.simpleMessage("Изменить"),
        "changeAvatar": MessageLookupByLibrary.simpleMessage("ПОМЕНЯТЬ АВАТАР"),
        "checkOldPassword": MessageLookupByLibrary.simpleMessage(
            "Надо подтвердить свой старый пароль!"),
        "colors": MessageLookupByLibrary.simpleMessage("Цвета"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "completedOutOf": m0,
        "create": MessageLookupByLibrary.simpleMessage("Создать"),
        "currentHabbits":
            MessageLookupByLibrary.simpleMessage("Нынешние привычки"),
        "customization": MessageLookupByLibrary.simpleMessage("Кастомизация"),
        "dark": MessageLookupByLibrary.simpleMessage("Темная"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
        "description": MessageLookupByLibrary.simpleMessage("Описание"),
        "email": MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "endDate": MessageLookupByLibrary.simpleMessage("Конец"),
        "fDay": MessageLookupByLibrary.simpleMessage("П"),
        "failed": MessageLookupByLibrary.simpleMessage("Failed"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Восстановить пароль"),
        "friDay": MessageLookupByLibrary.simpleMessage("Пят"),
        "friday": MessageLookupByLibrary.simpleMessage("Пятница"),
        "generalStatistic":
            MessageLookupByLibrary.simpleMessage("General statistic:"),
        "habitDays": MessageLookupByLibrary.simpleMessage("Дни привычек"),
        "habitName": MessageLookupByLibrary.simpleMessage("Привычка"),
        "habitType": MessageLookupByLibrary.simpleMessage("Тип привычки"),
        "halfDone": MessageLookupByLibrary.simpleMessage("На пол пути!"),
        "haveAccountMessage":
            MessageLookupByLibrary.simpleMessage("Уже существует аккаунт?"),
        "hintMissing": m1,
        "home": MessageLookupByLibrary.simpleMessage("Главная"),
        "iconTap": MessageLookupByLibrary.simpleMessage(
            "Tap on the icon to open the info!"),
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
        "loading": MessageLookupByLibrary.simpleMessage("Грузится..."),
        "loginError": MessageLookupByLibrary.simpleMessage(
            "Такого аккаунта нет, попробуйте еще раз!"),
        "mDay": MessageLookupByLibrary.simpleMessage("П"),
        "maxValue": m2,
        "monDay": MessageLookupByLibrary.simpleMessage("Пон"),
        "monday": MessageLookupByLibrary.simpleMessage("Понедельник"),
        "multiple": MessageLookupByLibrary.simpleMessage("Множественное ту-ду"),
        "mutability": MessageLookupByLibrary.simpleMessage("Изменяемость"),
        "mutable": MessageLookupByLibrary.simpleMessage("Изменяемая"),
        "name": MessageLookupByLibrary.simpleMessage("Имя"),
        "nameOfHabit":
            MessageLookupByLibrary.simpleMessage("Название привычки"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Новый пароль"),
        "no": MessageLookupByLibrary.simpleMessage("Нет"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Нет аккаунта?"),
        "noConnection": MessageLookupByLibrary.simpleMessage(
            "Нет подключения к интернету!"),
        "noHabitsThisDay":
            MessageLookupByLibrary.simpleMessage("Сегодня без привычек!"),
        "noInternet": MessageLookupByLibrary.simpleMessage(
            "Проверьте ваше соединение с интернетом!"),
        "noProgram": MessageLookupByLibrary.simpleMessage("Пока ничего нет!"),
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
        "programName":
            MessageLookupByLibrary.simpleMessage("Название программы"),
        "progressToday": MessageLookupByLibrary.simpleMessage("Progress today"),
        "sDay": MessageLookupByLibrary.simpleMessage("В"),
        "satDay": MessageLookupByLibrary.simpleMessage("Суб"),
        "saturday": MessageLookupByLibrary.simpleMessage("Суббота"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "setAtLeast1Day":
            MessageLookupByLibrary.simpleMessage("Выберете хоть 1 день!"),
        "setDates": MessageLookupByLibrary.simpleMessage("Длительность"),
        "setNow": MessageLookupByLibrary.simpleMessage("Установить"),
        "setReminder":
            MessageLookupByLibrary.simpleMessage("Установить напоминание"),
        "settingsNoInternet": MessageLookupByLibrary.simpleMessage(
            "Приложение переходит в локальный режим, режим редактирования недоступен"),
        "shouldNumeric": MessageLookupByLibrary.simpleMessage(
            "Числовое значение от 0 до максимума"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти!"),
        "signOut": MessageLookupByLibrary.simpleMessage("Выйти с аккаунта"),
        "signUp": MessageLookupByLibrary.simpleMessage("Регистрация!"),
        "smallDescription":
            MessageLookupByLibrary.simpleMessage("Описание привычки"),
        "somethingWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так!"),
        "sourceCode": MessageLookupByLibrary.simpleMessage("Код проекта"),
        "stDay": MessageLookupByLibrary.simpleMessage("С"),
        "startDate": MessageLookupByLibrary.simpleMessage("Старт"),
        "stats": MessageLookupByLibrary.simpleMessage("Статистика"),
        "steps": MessageLookupByLibrary.simpleMessage("Шаги"),
        "streak": MessageLookupByLibrary.simpleMessage("Streak"),
        "submit": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "submitCapitalised":
            MessageLookupByLibrary.simpleMessage("ПОДТВЕРДИТЬ"),
        "submitDeleting": MessageLookupByLibrary.simpleMessage(
            "Вы собираетесь удалить программу, позже не будет никакой вохможности ее восстановить!"),
        "sunDay": MessageLookupByLibrary.simpleMessage("Вос"),
        "sunday": MessageLookupByLibrary.simpleMessage("Воскресенье"),
        "system": MessageLookupByLibrary.simpleMessage("Системная"),
        "tDay": MessageLookupByLibrary.simpleMessage("В"),
        "telegram": MessageLookupByLibrary.simpleMessage("Написать мне"),
        "thDay": MessageLookupByLibrary.simpleMessage("Ч"),
        "thuDay": MessageLookupByLibrary.simpleMessage("Чет"),
        "thursday": MessageLookupByLibrary.simpleMessage("Четверг"),
        "toMuch": MessageLookupByLibrary.simpleMessage("Уже выполнили!"),
        "todo": MessageLookupByLibrary.simpleMessage("Ту-ду"),
        "tueDay": MessageLookupByLibrary.simpleMessage("Вто"),
        "tuesday": MessageLookupByLibrary.simpleMessage("Вторник"),
        "versus": MessageLookupByLibrary.simpleMessage("Против"),
        "wDay": MessageLookupByLibrary.simpleMessage("С"),
        "wantToLogOut": MessageLookupByLibrary.simpleMessage(
            "Вы точно хотите выйти с аккаунта?"),
        "warning": MessageLookupByLibrary.simpleMessage("Предупреждение!"),
        "water": MessageLookupByLibrary.simpleMessage("Вода"),
        "wedDay": MessageLookupByLibrary.simpleMessage("Сре"),
        "wednesday": MessageLookupByLibrary.simpleMessage("Среда"),
        "yes": MessageLookupByLibrary.simpleMessage("Да"),
        "yourCurrentStreak":
            MessageLookupByLibrary.simpleMessage("Your current streak:")
      };
}
