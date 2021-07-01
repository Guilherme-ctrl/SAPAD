import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  final bool? medo;
  final bool? ansi;
  final bool? triste;
  final bool? stress;
  final bool? raiva;

  MusicPage(
      {Key? key, this.medo, this.ansi, this.triste, this.stress, this.raiva})
      : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  AudioPlayer? _player;
  late AudioCache cache;

  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Musicoterapia",
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black87,
        body: Column(children: [
          //Card 1
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/Guitar.png"))),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Saiba sobre\n MUSICOTERAPIA",
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                _requestPop(context);
              },
            ),
          ),
          //Card 2
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 60.0),
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Musica Classica",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(100.0)),
                        child: IconButton(
                          iconSize: 50.0,
                          color: Colors.purple,
                          onPressed: () {
                            if (!playing) {
                              cache.play("Med1.mp3");
                              setState(() {
                                playBtn = Icons.pause;
                                playing = true;
                              });
                            } else {
                              _player!.pause();
                              setState(() {
                                playBtn = Icons.play_arrow;
                                playing = false;
                              });
                            }
                          },
                          icon: Icon(playBtn),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                _requestPop(context);
              },
            ),
          ),
          /* //Card 3
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 103.0),
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Sua Musica",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(100.0)),
                        child: IconButton(
                          iconSize: 50.0,
                          color: Colors.purple,
                          onPressed: () {
                            if (!playing) {
                              cache.play("Med1.mp3");
                              setState(() {
                                playBtn = Icons.pause;
                                playing = true;
                              });
                            } else {
                              _player.pause();
                              setState(() {
                                playBtn = Icons.play_arrow;
                                playing = false;
                              });
                            }
                          },
                          icon: Icon(playBtn),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                _requestPop(context);
              },
            ),
          ), */
        ]));
  }

  _requestPop(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.purple[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            content: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: Text("Explicação sobre musicoterapia"),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}
