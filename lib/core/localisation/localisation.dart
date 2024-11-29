import 'dart:ui';

import 'package:get/get.dart';

import 'translations/en_US.dart';

class AppLocalisation extends Translations {
  static const fallbackLocale = Locale('en', 'US');
  static Locale? get locale => fallbackLocale;

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
      };
}
