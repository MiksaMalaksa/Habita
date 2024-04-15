import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final Map<Locale, CountryFlag> flags = {
  const Locale.fromSubtags(languageCode: 'en',countryCode: null): CountryFlag.fromCountryCode(
    'gb',
    height: 20,
    width: 30,
  ),
  const Locale.fromSubtags(languageCode: 'cs', countryCode: null): CountryFlag.fromCountryCode(
    'cz',
    height: 20,
    width: 30,
  ),
  const Locale.fromSubtags(languageCode: 'ru'): CountryFlag.fromCountryCode(
    'ru',
    height: 20,
    width: 30,
  )
};
