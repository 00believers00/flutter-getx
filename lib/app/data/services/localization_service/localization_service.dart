import 'dart:ui';

import 'package:get/get.dart';

import '../../../constants/lang/en_us.dart';
import '../../../constants/lang/ja_jp.dart';
import '../../../constants/lang/th_th.dart';
import '../../../constants/lang/tr_tr.dart';



class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('th', 'TH');

  // Supported languages
  // Needs to be same order with locales
  static final languages = [
    'English',
    'Türkçe',
    '日本語',
    'ภาษาไทย'
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR'),
    const Locale('ja', 'JP'),
    const Locale('th', 'TH'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr_TR': trTR,
        'ja_JP': jaJP,
        'th_TH': thTh,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `languages` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < languages.length; i++) {
      if (lang == languages[i]) return locales[i];
    }
    return Get.locale;
  }
}
