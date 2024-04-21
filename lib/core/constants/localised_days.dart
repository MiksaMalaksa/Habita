import 'package:flutter/material.dart';
import 'package:habita/generated/l10n.dart';

class LocalisedDays {
  static List<String> localisedSmall(BuildContext context) {
    return <String>[
      S.of(context).mDay,
      S.of(context).tDay,
      S.of(context).wDay,
      S.of(context).thDay,
      S.of(context).fDay,
      S.of(context).stDay,
      S.of(context).sDay,
    ];
  }

  static List<String> localisedMedium(BuildContext context) {
    return <String>[
      S.of(context).monDay,
      S.of(context).tueDay,
      S.of(context).wedDay,
      S.of(context).thuDay,
      S.of(context).friDay,
      S.of(context).satDay,
      S.of(context).sunDay,
    ];
  }

  static List<String> localisedBig(BuildContext context,
      [bool withAll = false]) {
    final localised = <String>[
      S.of(context).monday,
      S.of(context).tuesday,
      S.of(context).wednesday,
      S.of(context).thursday,
      S.of(context).friday,
      S.of(context).saturday,
      S.of(context).sunday,
    ];
    withAll ? localised.insert(0, S.of(context).all) : null;
    return localised;
  }
}
