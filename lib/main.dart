import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/core/theme/theme/my_theme.dart';
import 'package:news_app/news/news_details.dart';
import 'package:news_app/news/search_screen.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'package:news_app/settings_tab/settings.dart';
import 'package:news_app/splash_view.dart';
import 'package:news_app/view/home/home_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
    getValueFromShared();

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(settingsProvider.languageCode),
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.routeName: (_) => HomeView(),
        NewsDetails.routeName: (_) => NewsDetails(),
        SearchScreen.routeName: (_) => SearchScreen(),
        SettingsTab.routeName: (_) => SettingsTab(),
        SplashView.routeName: (_) => SplashView(),
      },
      initialRoute: SplashView.routeName,
    );
  }

  getValueFromShared() async {
    final pref = await SharedPreferences.getInstance();
    settingsProvider.changeLanguage(pref.getString("lang") ?? 'en');
  }
}
