import 'package:flutter/material.dart';
import '../Classes/ClassDuas.dart';
import 'DuasGrid.dart';

class Hadith extends StatefulWidget {
  const Hadith({Key? key}) : super(key: key);

  @override
  State<Hadith> createState() => _HadithState();
}

class _HadithState extends State<Hadith> {

  final List<DuaData> duas = [
    DuaData('Dua for Guidance', 'ہدایت کی دعا','https://duaconnect.com/?powerpress_pinw=263-podcast','رَبَّنَا آتِنَا مِنْ لَدُنْكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا.'),
    DuaData('Dua for Forgiveness', 'مغفرت کی دعا','https://www.jannah.org/ramadan/ghamdi_dua.mp3','اللَّهُمَّ اغْفِرْ لِي ذَنْبِي كُلَّهُ، دِقَّهُ وَجِلَّهُ، وَأَوَّلَهُ وَآخِرَهُ وَعَلَانِيَتَهُ وَسِرَّهُ '),
    DuaData('Dua for Patience', 'صبر کی دعا','',''),
    DuaData('Dua for Healing', 'شفاء کی دعا','',''),
    DuaData('Dua for Gratitude', 'شکریہ کی دعا','',''),
    DuaData('Dua for Strength', 'طاقت کی دعا','',''),
    DuaData('Dua for Protection', 'حفاظت کی دعا','',''),
    DuaData('Dua for Peace', 'امن کی دعا','',''),
    DuaData('Dua for Prosperity', 'کامیابی کی دعا','',''),
    DuaData('Dua for Family', 'خاندان کی دعا' ,'',''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Duas'),
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return DuaGridItem(dua: duas[index]);
        },
        itemCount: duas.length,
      ),
    );
  }
}

