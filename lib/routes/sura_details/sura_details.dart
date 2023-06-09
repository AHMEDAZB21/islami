import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_details_args.dart';
import 'package:provider/provider.dart';
import '../../provider/settings_provider.dart';
import '../../untils/app_colors.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura details";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraLines.isEmpty) {
      readSuraContent(args.fileName);
    }
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
            args.suraName,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        body: suraLines.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return Text(
                    "(${index+1}) ${suraLines[index]}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                },
                separatorBuilder: (context, index)
                {
                  return const Divider(
                    height: 3.0,
                    thickness: 3.0,
                    color: AppColors.primiaryColor,
                  );
                },
          itemCount: suraLines.length,
              ),
      ),
    );
  }

  readSuraContent(String fileName) async {
    String suraContent = await rootBundle.loadString("assets/files/$fileName");
    suraLines = suraContent.trim().split("\n ");
    setState(() {});
  }
}
