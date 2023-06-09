import 'package:flutter/material.dart';
import 'package:islami/routes/home/taps/ahadeth/ahadeth_tap.dart';
import 'package:islami/routes/home/taps/quran/quran_tap.dart';
import 'package:islami/routes/home/taps/radio/radio_tap.dart';
import 'package:islami/routes/home/taps/sebha/sebha_tap.dart';
import 'package:islami/untils/app_colors.dart';
import 'package:provider/provider.dart';
import '../provider/settings_provider.dart';
import 'home/taps/setting/setting_tap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTap = 4;

  List<Widget> taps = [
    QuranTap(),
    AhadethTap(),
    SebhaTap(),
    RadioTap(),
    SettingTap(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              provider.currentTheme == ThemeMode.light ?
              'assets/bg3.png' : 'assets/bg.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami,
          ),
        ),
        body: taps[currentTap],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTap,
          onTap: (index) {
            currentTap = index;
            setState(() {});
          },
          items: [
            const BottomNavigationBarItem(
              label: 'QURAN',
              icon: ImageIcon(
                AssetImage('assets/quranbnb.png'),
              ),
            ),
            const BottomNavigationBarItem(
              label: 'ahadeth',
              icon: ImageIcon(
                AssetImage('assets/ahadeth.png'),
              ),
            ),
            const BottomNavigationBarItem(
              label: 'SEBHA',
              icon: ImageIcon(
                AssetImage('assets/sebha_blue.png'),
              ),
            ),
            const BottomNavigationBarItem(
              label: 'RADIO',
              icon: ImageIcon(
                AssetImage('assets/radio_blue.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.settings,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
