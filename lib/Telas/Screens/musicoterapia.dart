import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
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
    var songs = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Songs')
        .get();
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
        body: ListView(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
            children: [
              //Card 1
              GestureDetector(
                child: Card(
                    color: Colors.black54,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.bookmarkMusic,
                                size: 50, color: Colors.red),
                            Expanded(
                              child: Text("Saiba mais sobre musicoterapia!!",
                                  style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 25))),
                            )
                          ],
                        ))),
                onTap: () {
                  _requestPop(context);
                },
              ),
              SizedBox(height: 20),

              //Card 2
              Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        child: Expanded(
                          child: Text(
                            "Musica Classica",
                            style: GoogleFonts.lora(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            textAlign: TextAlign.center,
                          ),
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
              SizedBox(height: 20),

              //Card 3
              Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        child: Expanded(
                          child: Text(
                            "Musica Personalizada",
                            style: GoogleFonts.lora(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            textAlign: TextAlign.center,
                          ),
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
                          icon: Icon(Icons.play_arrow),
                        ),
                      )
                    ],
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
                child: Text(
                  " Podendo ser utilizada como forma de reabilitação, prevenção ou para melhorar a qualidade de vida. Ela pode ser praticada de forma individual ou comunitária.\n\nA música age na mesma região do cérebro que é responsável pelas emoções. Assim, dependo da música que escutamos, podemos nos sentir mais motivados e alegres ou mais introspectivos. Sendo assim, é importante procurar um musicoterapeuta para que ele indique as músicas a serem ouvidas e por quanto tempo deve ser feita a prática.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
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
