import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/untils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../provider/settings_provider.dart';

class SebhaTap extends StatefulWidget {
  @override
  _SebhaTapState createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  List<String> zekr = ["الحمدلله", "الله أكبر", "سبحان الله"];
  double rotation = 0;
  int number = 0;
  int counter = 0;

  void onPressed() {
    setState(() {
      rotation = rotation + (pi / 16.5);
      setState(() {
        number++;
        if (number > 33) {
          setState(() {
            number = 0;
            counter++;
            if (counter == 3) {
              setState(() {
                counter = 0;
              });
            }
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Center(
      child: Column(
        children: [
          Transform.rotate(
            angle: rotation,
            child: Column(
              children: [
                Container(
                  child: InkWell(
                    onTap: onPressed,
                    child: Image.asset(
                      provider.currentTheme == ThemeMode.light ?
                      'assets/tsbeeh_light.png' : 'assets/tsbeeh_dark.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 41.0,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 34.0,
          ),
          Container(
            padding: const EdgeInsets.all(25.0),
            decoration: BoxDecoration(
                color: AppColors.primiaryColor.withOpacity(.5),
                borderRadius: BorderRadius.circular(20.0)),
            child: Text(
              "$number",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 22.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.primiaryColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              zekr[counter],
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
