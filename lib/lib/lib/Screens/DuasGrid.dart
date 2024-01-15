import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../Classes/ClassDuas.dart';

class DuaGridItem extends StatefulWidget {
  final DuaData dua;

  DuaGridItem({required this.dua});

  @override
  _SurahGridItemState createState() => _SurahGridItemState();
}

class _SurahGridItemState extends State<DuaGridItem> {
  final playerController = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isPlaying) {
          playerController.pause();
        } else {
          playerController.setUrl(widget.dua.audioURL);
          playerController.play();
        }
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      child: Container(
        color: Colors.brown.shade300,
        margin: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align text at the top
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(widget.dua.nameEnglish, style: TextStyle(fontSize: 16)),
            ),
            Align(
              alignment: Alignment.bottomCenter, // Align text at the left edge
              child: Text(widget.dua.nameUrdu, style: TextStyle(fontSize: 16)),
            ),
            Align(
              alignment: Alignment.center, // Align text at the left edge
              child: Padding(padding: EdgeInsets.all(15.0),
              child: Text(widget.dua.arabic, style: TextStyle(fontSize: 16,))),
            ),
            Align(
              alignment: Alignment.center, // Align the icon at the right edge
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 40,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
