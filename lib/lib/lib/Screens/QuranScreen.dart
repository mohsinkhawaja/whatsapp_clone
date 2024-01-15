import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:qurannew/Screens/Ayas.dart';
//import '../QuranModel/model.dart';
//import 'package:qurannew/QuranModel';
import '../JsonFormate/JsonQuranModel.dart';
class SurahPage extends StatelessWidget {
  const SurahPage({super.key});
  final String title = 'القرآن الكريم';
  Future<QuranModel> fetchData() async {
    final response = await http
        .get(Uri.https("api.alquran.cloud","/v1/quran/quran-uthmani"));
    var body = jsonDecode(response.body.toString());
    //var data = response.body;
    // var name = jsonDecode(data)['data']['surahs'][0]['ayahs'][0]['text'];
    // print(name);

    QuranModel quranmodel = QuranModel.fromJson(body);
    return quranmodel;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade400,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        title: Text(
          title ?? "",
          style: TextStyle(
              fontFamily: 'qalam', fontWeight: FontWeight.w300, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<QuranModel>(
        future: fetchData(),
        builder: (context,  snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 15,
                  color: Colors.brown,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Please, Check your Internet ...${snapshot.error}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.data!.surahs!.length, //144,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    child: Expanded(
                      child: ListTile(
                        hoverColor: Colors.brown.shade300,
                          title: Row(children: [
                            Text(
                              snapshot.data!.data!.surahs![index].number
                                  .toString(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Flexible(
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.data.surahs[index].englishName,
                                      style: TextStyle(
                                          color: Colors.brown.shade900, fontSize: 14),
                                    ),
                                    Text(
                                      snapshot.data!.data.surahs[index]
                                          .englishNameTranslation,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),

                                    Text(
                                      snapshot.data!.data.surahs[index].revelationType.name,
                                      style: TextStyle(
                                          color: Colors.brown.shade900, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              snapshot.data!.data.surahs[index].name,
                              style:
                              TextStyle(fontFamily: 'mushaf', fontSize: 25),
                            ),
                          ]),
                          onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> AyaatPage(
                                    data: snapshot.data!.data.surahs[index].name,
                                    text: snapshot.data!.data.surahs[index].ayahs,
                                    index: index,
                                    type: snapshot.data!.data.surahs[index].revelationType)));
                          }),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}