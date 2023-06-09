import 'package:flutter/material.dart';
import 'package:islami/provider/settings_provider.dart';
import 'package:islami/untils/app_colors.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              "Select Your Language",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Divider(
              color: AppColors.primiaryColor,
              thickness: 3,
              height: 3,
            ),
            const SizedBox(
              height: 22.0,
            ),
            InkWell(
              onTap: () {
                provider.changeCurrentLocale("en");
                Navigator.pop(context);
              },
              child: getLanguageRow(provider.currentLocale == "en", "English"),
            ),
            const SizedBox(
              height: 16.0,
            ),
            InkWell(
              onTap: () {
                provider.changeCurrentLocale("ar");
                Navigator.pop(context);
              },
              child: getLanguageRow(provider.currentLocale == "ar", "العربية"),
            ),
          ],
        ),
      ),
    );
  }

  getLanguageRow(bool isSelected, String language) {
    if (isSelected) {
      return Text(
        language,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: AppColors.primiaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        language,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: AppColors.accentColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      );
    }
  }
}
