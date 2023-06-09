import 'package:flutter/material.dart';
import 'package:islami/model/hadeth.dart';
import 'package:provider/provider.dart';
import '../../provider/settings_provider.dart';
import '../../untils/app_colors.dart';

class HadethDetails extends StatelessWidget {

  static const String routName = "hadeth details";

  @override
  Widget build(BuildContext context) {
    var hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            hadeth.title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Text(
              hadeth.content,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
