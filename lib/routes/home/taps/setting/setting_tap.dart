import 'package:flutter/material.dart';
import 'package:islami/provider/settings_provider.dart';
import 'package:islami/untils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'language_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTap extends StatefulWidget {

  @override
  State<SettingTap> createState() => _SettingTapState();
}
bool switchValue = false;


class _SettingTapState extends State<SettingTap> {

  @override
  void initState() {
    loadBool();
    super.initState();
  }

  loadBool() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    switchValue = preferences.getBool('switchValue') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    @override
    saveBool() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setBool('switchValue', switchValue);
    }
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .1,
        right: 18,
        left: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 22.0,
          ),
          InkWell(
            onTap: () {
              onLanguageRowClick(context);
            },
            child: getRowOption(
                provider.currentLocale == "en" ? "English" : "العربية"),
          ),
          const SizedBox(
            height: 22.0,
          ),
          Row(
            children: [
              Text(
                "Dark Mode",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              Switch(
                   activeColor: AppColors.accentColorDark,
                   // activeTrackColor: Colors.cyan,
                  // inactiveThumbColor: AppColors.accentColorDark,
                  // inactiveTrackColor: AppColors.accentColor,
                  // splashRadius: 50.0,
                  value: switchValue,
                  onChanged: (newSwitchValue) {
                    switchValue = newSwitchValue;
                    setState(() {
                      if (switchValue) {
                        provider.changeCurrentTheme(ThemeMode.dark);
                      } else {
                        provider.changeCurrentTheme(ThemeMode.light);
                      }
                    });
                    saveBool();
                  }),
            ],
          ),
          const SizedBox(
            height: 22.0,
          ),
        ],
      ),
    );
  }

  Widget getRowOption(String selectedOption) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primiaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedOption,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  void onLanguageRowClick(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void onThemeRowClick() {}
}
