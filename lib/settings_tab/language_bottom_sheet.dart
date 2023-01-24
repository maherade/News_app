import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 150.0),
            height: 5,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                settingsProvider.changeLanguage('en');
              });
            },
            child: settingsProvider.isEnglish()
                ? getSelectedItem(AppLocalizations.of(context)!.english)
                : getUnSelectedItem(AppLocalizations.of(context)!.english),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                settingsProvider.changeLanguage('ar');
              });
            },
            child: settingsProvider.isEnglish()
                ? getUnSelectedItem(AppLocalizations.of(context)!.arabic)
                : getSelectedItem(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 24,
          ),
        ),
        Icon(
          Icons.check,
          size: 30,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24),
    );
  }
}
