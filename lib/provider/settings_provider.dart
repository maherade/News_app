import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String languageCode = 'en';

  void changeLanguage(String lang) async {
    final pref = await SharedPreferences.getInstance();

    if (languageCode == lang) return;
    languageCode = lang;
    pref.setString("lang", languageCode);
    notifyListeners();
  }

  isEnglish() {
    return languageCode == 'en';
  }
}
