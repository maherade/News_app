import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'package:news_app/settings_tab/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'settings-tab';

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              title: Text(AppLocalizations.of(context)!.settings),
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.zero,
                          color: Colors.white,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          )),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showLanguageBottomSheet();
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              settingsProvider.isEnglish()
                                  ? AppLocalizations.of(context)!.english
                                  : AppLocalizations.of(context)!.arabic,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Theme.of(context).primaryColor,
                              size: 25,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageBottomSheet();
        });
  }
}
