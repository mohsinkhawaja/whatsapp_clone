import 'package:qurannew/Screens/Duas.dart';
import 'package:qurannew/Screens/QuranScreen.dart';
import 'package:flutter/material.dart';
//import '../Bottombar.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IconData? icon;
  String? sectionText;
  int _currentPage = 0;
  List<Widget> _pages = [
    // Add your page widgets here
    Hadith(),
    SurahPage(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.shade300,
        body:
        CustomScrollView(

          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.brown,
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://c8.alamy.com/comp/FD4T8C/paris-great-mosque-quranic-surah-in-calligraphy-FD4T8C.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

           Container(
             height: 50,
             width: 50,
             child: ,

           )
          ],
        ),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        fixedColor: Colors.white,
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },// Call _onItemTapped when an item is tapped
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.brown,
            icon: GestureDetector(
              onTap: () {
                // Handle the tap on Namaz
              },
              child: Icon(Icons.mosque),
            ),
            label: 'Namaz',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Handle the tap on Qibla
              },
              child: Icon(Icons.near_me),
            ),
            label: 'Qibla',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Handle the tap on Hadiths
              },
              child: Icon(Icons.book_outlined),
            ),
            label: 'Hadiths',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Hadith()));

              },
              child: Icon(Icons.clean_hands_sharp),
            ),
            label: 'Duas',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SurahPage()));
              },
              child: Icon(Icons.book),
            ),
            label: 'Quran',
          ),
        ],
      ),

    );

  }
}
