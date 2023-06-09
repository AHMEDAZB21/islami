import 'package:flutter/material.dart';
import 'package:islami/model/sura_details_args.dart';
import 'package:islami/routes/sura_details/sura_details.dart';
import 'package:islami/untils/app_colors.dart';

class QuranTap extends StatelessWidget {
  List<String> suraNames = ["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 30,
          child: Image.asset('assets/quran.png'),
        ),
        const Divider(
          color: AppColors.primiaryColor,thickness: 2,height: 3,
        ),
        const SizedBox(height: 5,),
        Text(
            'Sura Name',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 5,),
        const Divider(
          color: AppColors.primiaryColor,thickness: 2,height: 3,
        ),
        Expanded(
          flex: 70,
            child: ListView.separated(
              itemCount: suraNames.length,
              itemBuilder: (context, index){
                return buildSuraNameItem(context , index);
              }, separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: AppColors.primiaryColor,thickness: 2,height: 3,
                );
            },
            ),
        ),
      ],
    );
  }

  Widget buildSuraNameItem(BuildContext context,int index){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.routeName,
        arguments: SuraDetailsArgs("${index+1}.txt", suraNames[index]),
        );
      },
      child: Text(
        suraNames[index],
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
