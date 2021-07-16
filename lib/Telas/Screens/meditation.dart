import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MeditationPage extends StatefulWidget {
  final bool? medo;
  final bool? ansi;
  final bool? triste;
  final bool? stress;
  final bool? raiva;

  MeditationPage(
      {Key? key, this.medo, this.ansi, this.triste, this.stress, this.raiva})
      : super(key: key);

  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final user = FirebaseAuth.instance.currentUser!;
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  late String _url;

  AudioPlayer? _player;
  late AudioCache cache;

  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
  }

  readFirebase() async {
    var songs = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Songs')
        .get();
    _url = songs.data()?['video'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Meditação Guiada",
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
                            Expanded(
                              child: Icon(MdiIcons.emoticonExcited,
                                  size: 50, color: Colors.red),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text("Saiba mais sobre Meditação!!",
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
              GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "Meditação Guiada",
                                  style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 25)),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        SizedBox(width: 40),
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
              SizedBox(height: 20),

              //Card 3
              Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            "Musica Personalizada",
                            style: GoogleFonts.lora(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(100.0)),
                        child: IconButton(
                          iconSize: 50.0,
                          color: Colors.purple,
                          onPressed: () {
                            abrirLink();
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
                  "Uma prática que engloba relaxamento corporal, diminuição da respiração, levando a um estado de paz, calma e tranquilidade, tanto física como mentalmente. É das condições básicas para se meditar é concentração e a atenção em algum foco, seja interno como a observação nos músculos da respiração, seja externo na concentração em algum som ou cheiro.\n\nEssa prática pode ser induzida por um facilitador, onde ele guia com as palavras o tipo de foco que o praticante terá, quais os músculos que ele deve relaxar assim por diante, ou todo o processo pode ser feito de forma autônoma pelo próprio praticante.",
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

  Future<void> abrirLink() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      print('Could not launch $_url');
    }
  }
}
