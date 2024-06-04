// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign Up!`
  String get signUp {
    return Intl.message(
      'Sign Up!',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccountMessage {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sign In!`
  String get signIn {
    return Intl.message(
      'Sign In!',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Password can not be less then 6!`
  String get incorrectPassword {
    return Intl.message(
      'Password can not be less then 6!',
      name: 'incorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `{hintText} is missing!`
  String hintMissing(Object hintText) {
    return Intl.message(
      '$hintText is missing!',
      name: 'hintMissing',
      desc: '',
      args: [hintText],
    );
  }

  /// `Do not have an account?`
  String get noAccount {
    return Intl.message(
      'Do not have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `No such account, try again!`
  String get loginError {
    return Intl.message(
      'No such account, try again!',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get incorrectSigningUp {
    return Intl.message(
      'Something went wrong!',
      name: 'incorrectSigningUp',
      desc: '',
      args: [],
    );
  }

  /// `Customization`
  String get customization {
    return Intl.message(
      'Customization',
      name: 'customization',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Additional settings`
  String get additionalSettings {
    return Intl.message(
      'Additional settings',
      name: 'additionalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Text me`
  String get telegram {
    return Intl.message(
      'Text me',
      name: 'telegram',
      desc: '',
      args: [],
    );
  }

  /// `Source code`
  String get sourceCode {
    return Intl.message(
      'Source code',
      name: 'sourceCode',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `CHANGE AVATAR`
  String get changeAvatar {
    return Intl.message(
      'CHANGE AVATAR',
      name: 'changeAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get oldPassword {
    return Intl.message(
      'Old password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Loggin out`
  String get alertLogout {
    return Intl.message(
      'Loggin out',
      name: 'alertLogout',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to log out?`
  String get wantToLogOut {
    return Intl.message(
      'Do you really want to log out?',
      name: 'wantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Restore password`
  String get forgetPassword {
    return Intl.message(
      'Restore password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Stats`
  String get stats {
    return Intl.message(
      'Stats',
      name: 'stats',
      desc: '',
      args: [],
    );
  }

  /// `Program`
  String get program {
    return Intl.message(
      'Program',
      name: 'program',
      desc: '',
      args: [],
    );
  }

  /// `Versus`
  String get versus {
    return Intl.message(
      'Versus',
      name: 'versus',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection!`
  String get noConnection {
    return Intl.message(
      'No internet connection!',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `The application goes into local mode, editing mode is not available`
  String get settingsNoInternet {
    return Intl.message(
      'The application goes into local mode, editing mode is not available',
      name: 'settingsNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get somethingWrong {
    return Intl.message(
      'Something went wrong!',
      name: 'somethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `Confirm old password befor submitting!`
  String get checkOldPassword {
    return Intl.message(
      'Confirm old password befor submitting!',
      name: 'checkOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection!`
  String get noInternet {
    return Intl.message(
      'Check your internet connection!',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Profile edited!`
  String get profileEdited {
    return Intl.message(
      'Profile edited!',
      name: 'profileEdited',
      desc: '',
      args: [],
    );
  }

  /// `Almost Done!`
  String get almostDone {
    return Intl.message(
      'Almost Done!',
      name: 'almostDone',
      desc: '',
      args: [],
    );
  }

  /// `Half Way Through!`
  String get halfDone {
    return Intl.message(
      'Half Way Through!',
      name: 'halfDone',
      desc: '',
      args: [],
    );
  }

  /// `Start taking actions!`
  String get nothingDone {
    return Intl.message(
      'Start taking actions!',
      name: 'nothingDone',
      desc: '',
      args: [],
    );
  }

  /// `{value1} of {value2} completed`
  String completedOutOf(Object value1, Object value2) {
    return Intl.message(
      '$value1 of $value2 completed',
      name: 'completedOutOf',
      desc: '',
      args: [value1, value2],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Colors`
  String get colors {
    return Intl.message(
      'Colors',
      name: 'colors',
      desc: '',
      args: [],
    );
  }

  /// `Icons`
  String get icons {
    return Intl.message(
      'Icons',
      name: 'icons',
      desc: '',
      args: [],
    );
  }

  /// `Invalid input`
  String get invalidInput {
    return Intl.message(
      'Invalid input',
      name: 'invalidInput',
      desc: '',
      args: [],
    );
  }

  /// `Immutable`
  String get immutable {
    return Intl.message(
      'Immutable',
      name: 'immutable',
      desc: '',
      args: [],
    );
  }

  /// `Mutable`
  String get mutable {
    return Intl.message(
      'Mutable',
      name: 'mutable',
      desc: '',
      args: [],
    );
  }

  /// `Set now`
  String get setNow {
    return Intl.message(
      'Set now',
      name: 'setNow',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get cancelCapitalized {
    return Intl.message(
      'CANCEL',
      name: 'cancelCapitalized',
      desc: '',
      args: [],
    );
  }

  /// `SUBMIT`
  String get submitCapitalised {
    return Intl.message(
      'SUBMIT',
      name: 'submitCapitalised',
      desc: '',
      args: [],
    );
  }

  /// `You can not start before today :)`
  String get invalidStartDate {
    return Intl.message(
      'You can not start before today :)',
      name: 'invalidStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End date`
  String get endDate {
    return Intl.message(
      'End date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Min days are 7 from today!`
  String get invalidEndDate {
    return Intl.message(
      'Min days are 7 from today!',
      name: 'invalidEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Habit name`
  String get habitName {
    return Intl.message(
      'Habit name',
      name: 'habitName',
      desc: '',
      args: [],
    );
  }

  /// `The name of habit`
  String get nameOfHabit {
    return Intl.message(
      'The name of habit',
      name: 'nameOfHabit',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Small description`
  String get smallDescription {
    return Intl.message(
      'Small description',
      name: 'smallDescription',
      desc: '',
      args: [],
    );
  }

  /// `Max - {maxValue}`
  String maxValue(Object maxValue) {
    return Intl.message(
      'Max - $maxValue',
      name: 'maxValue',
      desc: '',
      args: [maxValue],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Multiple to-do`
  String get multiple {
    return Intl.message(
      'Multiple to-do',
      name: 'multiple',
      desc: '',
      args: [],
    );
  }

  /// `To-do`
  String get todo {
    return Intl.message(
      'To-do',
      name: 'todo',
      desc: '',
      args: [],
    );
  }

  /// `Steps`
  String get steps {
    return Intl.message(
      'Steps',
      name: 'steps',
      desc: '',
      args: [],
    );
  }

  /// `Water`
  String get water {
    return Intl.message(
      'Water',
      name: 'water',
      desc: '',
      args: [],
    );
  }

  /// `Type of habit`
  String get habitType {
    return Intl.message(
      'Type of habit',
      name: 'habitType',
      desc: '',
      args: [],
    );
  }

  /// `Set reminder`
  String get setReminder {
    return Intl.message(
      'Set reminder',
      name: 'setReminder',
      desc: '',
      args: [],
    );
  }

  /// `off`
  String get off {
    return Intl.message(
      'off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Habit days`
  String get habitDays {
    return Intl.message(
      'Habit days',
      name: 'habitDays',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Should be numeric value between 0 and max value`
  String get shouldNumeric {
    return Intl.message(
      'Should be numeric value between 0 and max value',
      name: 'shouldNumeric',
      desc: '',
      args: [],
    );
  }

  /// `M`
  String get mDay {
    return Intl.message(
      'M',
      name: 'mDay',
      desc: '',
      args: [],
    );
  }

  /// `T`
  String get tDay {
    return Intl.message(
      'T',
      name: 'tDay',
      desc: '',
      args: [],
    );
  }

  /// `W`
  String get wDay {
    return Intl.message(
      'W',
      name: 'wDay',
      desc: '',
      args: [],
    );
  }

  /// `T`
  String get thDay {
    return Intl.message(
      'T',
      name: 'thDay',
      desc: '',
      args: [],
    );
  }

  /// `F`
  String get fDay {
    return Intl.message(
      'F',
      name: 'fDay',
      desc: '',
      args: [],
    );
  }

  /// `S`
  String get stDay {
    return Intl.message(
      'S',
      name: 'stDay',
      desc: '',
      args: [],
    );
  }

  /// `S`
  String get sDay {
    return Intl.message(
      'S',
      name: 'sDay',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get monDay {
    return Intl.message(
      'Mon',
      name: 'monDay',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get tueDay {
    return Intl.message(
      'Tue',
      name: 'tueDay',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get wedDay {
    return Intl.message(
      'Wed',
      name: 'wedDay',
      desc: '',
      args: [],
    );
  }

  /// `Thu`
  String get thuDay {
    return Intl.message(
      'Thu',
      name: 'thuDay',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get friDay {
    return Intl.message(
      'Fri',
      name: 'friDay',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get satDay {
    return Intl.message(
      'Sat',
      name: 'satDay',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get sunDay {
    return Intl.message(
      'Sun',
      name: 'sunDay',
      desc: '',
      args: [],
    );
  }

  /// `No habits this day!`
  String get noHabitsThisDay {
    return Intl.message(
      'No habits this day!',
      name: 'noHabitsThisDay',
      desc: '',
      args: [],
    );
  }

  /// `Set dates`
  String get setDates {
    return Intl.message(
      'Set dates',
      name: 'setDates',
      desc: '',
      args: [],
    );
  }

  /// `Mutability`
  String get mutability {
    return Intl.message(
      'Mutability',
      name: 'mutability',
      desc: '',
      args: [],
    );
  }

  /// `Aim of the program`
  String get aimOfTheProgram {
    return Intl.message(
      'Aim of the program',
      name: 'aimOfTheProgram',
      desc: '',
      args: [],
    );
  }

  /// `Aim`
  String get aim {
    return Intl.message(
      'Aim',
      name: 'aim',
      desc: '',
      args: [],
    );
  }

  /// `Program name`
  String get programName {
    return Intl.message(
      'Program name',
      name: 'programName',
      desc: '',
      args: [],
    );
  }

  /// `Current habbits`
  String get currentHabbits {
    return Intl.message(
      'Current habbits',
      name: 'currentHabbits',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Set at least 1 day!`
  String get setAtLeast1Day {
    return Intl.message(
      'Set at least 1 day!',
      name: 'setAtLeast1Day',
      desc: '',
      args: [],
    );
  }

  /// `No program for now!`
  String get noProgram {
    return Intl.message(
      'No program for now!',
      name: 'noProgram',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 1 habit!`
  String get atLeast1Habit {
    return Intl.message(
      'Must be at least 1 habit!',
      name: 'atLeast1Habit',
      desc: '',
      args: [],
    );
  }

  /// `Program shoud last at least for 7 days!`
  String get atLeast7Days {
    return Intl.message(
      'Program shoud last at least for 7 days!',
      name: 'atLeast7Days',
      desc: '',
      args: [],
    );
  }

  /// `Warning!`
  String get warning {
    return Intl.message(
      'Warning!',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `You are going to delete program, later there would be no opportunity to restore it!`
  String get submitDeleting {
    return Intl.message(
      'You are going to delete program, later there would be no opportunity to restore it!',
      name: 'submitDeleting',
      desc: '',
      args: [],
    );
  }

  /// `To much things for today!`
  String get toMuch {
    return Intl.message(
      'To much things for today!',
      name: 'toMuch',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `You did it`
  String get youDidIt {
    return Intl.message(
      'You did it',
      name: 'youDidIt',
      desc: '',
      args: [],
    );
  }

  /// `Tap on the icon to open the info!`
  String get iconTap {
    return Intl.message(
      'Tap on the icon to open the info!',
      name: 'iconTap',
      desc: '',
      args: [],
    );
  }

  /// `Progress today:`
  String get progressToday {
    return Intl.message(
      'Progress today:',
      name: 'progressToday',
      desc: '',
      args: [],
    );
  }

  /// `General statistic:`
  String get generalStatistic {
    return Intl.message(
      'General statistic:',
      name: 'generalStatistic',
      desc: '',
      args: [],
    );
  }

  /// `Your current streak:`
  String get yourCurrentStreak {
    return Intl.message(
      'Your current streak:',
      name: 'yourCurrentStreak',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Streak`
  String get streak {
    return Intl.message(
      'Streak',
      name: 'streak',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Remain:`
  String get remain {
    return Intl.message(
      'Remain:',
      name: 'remain',
      desc: '',
      args: [],
    );
  }

  /// `Done today:`
  String get doneToday {
    return Intl.message(
      'Done today:',
      name: 'doneToday',
      desc: '',
      args: [],
    );
  }

  /// `No habits for now!`
  String get noHabitsForNow {
    return Intl.message(
      'No habits for now!',
      name: 'noHabitsForNow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
