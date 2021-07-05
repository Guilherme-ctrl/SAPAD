import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  late String _url;

  AudioPlayer? _player;
  late AudioCache cache;

  void initState() {
    super.initState();
    readFirebase();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
  }

  readFirebase() async {
    var songs =
        await FirebaseFirestore.instance.collection('Songs').doc('001').get();
    _url = songs.data()?['music'];
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
          ),
          //Card 3
          Padding(
            padding: EdgeInsets.all(10.0),
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
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Musica Personalizada",
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
                          abrirYoutube();
                        },
                        icon: Icon(playBtn),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
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

  Future<void> abrirYoutube() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      print('Could not launch $_url');
    }
  }
}
