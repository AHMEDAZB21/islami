import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadeth.dart';
import 'package:islami/routes/hadeth_details/hadeth_details.dart';
import 'package:islami/untils/app_colors.dart';

class AhadethTap extends StatefulWidget {
  @override
  State<AhadethTap> createState() => _AhadethTapState();
}

class _AhadethTapState extends State<AhadethTap> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      readAhadethFile();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 30,
          child: Image.asset("assets/hadeth.png"),
        ),
        const Divider(
          color: AppColors.primiaryColor,
          thickness: 2,
          height: 3,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Ahadeth',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: AppColors.primiaryColor,
          thickness: 2,
          height: 3,
        ),
        Expanded(
          flex: 70,
          child: ListView.separated(
            itemCount: ahadethList.length,
            itemBuilder: (context, index) {
              return buildHadethItem(context, index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: AppColors.primiaryColor,
                thickness: 2,
                height: 3,
              );
            },
          ),
        ),
      ],
    );
  }

  readAhadethFile() async {
    String hadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = hadethFile.split("#");

    for (int i = 0; i < ahadeth.length; i++) {
      List<String> singleHadethLines = ahadeth[i].trim().split("\n");
      String title = singleHadethLines.removeAt(0);
      String content = singleHadethLines.join("\n");
      ahadethList.add(Hadeth(title, content));
    }
    setState(() {});
  }

  Widget buildHadethItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetails.routName,
          arguments: ahadethList[index],
        );
      },
      child: Text(
        ahadethList[index].title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
