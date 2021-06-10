import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

import 'helper/helper.dart';

class MeditationPage extends StatefulWidget {
  final bool med;
  final bool ansi;
  final bool raiva;
  final bool triste;
  final bool stress;

  const MeditationPage(
      {Key key, this.med, this.ansi, this.raiva, this.triste, this.stress})
      : super(key: key);
  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  TabController controller;
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicPeso = new Duration();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
          bottomNavigationBar: Helper(
              med: widget.med,
              ansi: widget.ansi,
              raiva: widget.raiva,
              triste: widget.triste,
              stress: widget.stress),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: Colors.blue.shade900,
                centerTitle: true,
                title: Text(
                  ' ',
                  style: TextStyle(fontSize: 30.0, fontFamily: 'hind'),
                ),
                bottom: TabBar(
                    unselectedLabelColor: Colors.white38,
                    indicatorColor: Colors.yellow,
                    labelColor: Colors.yellow,
                    controller: controller,
                    tabs: <Widget>[
                      Text(
                        "Pratica",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        "O que é?",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ]),
              )),
          body: TabBarView(children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/FundoTeste.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: 400.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                right: 100.0,
                                left: 10.0,
                                top: 10.0,
                                bottom: 10.0),
                            child: Text(
                              'Acompanhar por\n\n texto?!',
                              style: TextStyle(fontSize: 25.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 100.0,
                            height: 200.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.blue.shade100,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      contentPadding: EdgeInsets.only(
                                          top: 10.0, left: 10.0, right: 10.0),
                                      title: new Text(
                                        "Nome da Meditação",
                                        textAlign: TextAlign.center,
                                      ),
                                      content: new Text(
                                        "Letra da Meditação",
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[
                                        new FlatButton(
                                          child: new Text("Ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              padding: EdgeInsets.all(10.0),
                              color: Colors.blue.shade200,
                              textColor: Colors.white,
                              child: Text(
                                'LER',
                                style: TextStyle(fontSize: 28.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 100.0, left: 5.0, right: 5.0, bottom: 0.1),
                    child: Container(
                      width: 400.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Container(
                              width: 190.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/Chakra.jpg'))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Container(
                              width: 500.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  slider(),
                                  Text(
                                    "${musicPeso.inMinutes}:${musicPeso.inSeconds.remainder(60)}",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                iconSize: 45.0,
                                color: Colors.blue,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.skip_previous,
                                ),
                              ),
                              IconButton(
                                iconSize: 62.0,
                                color: Colors.blue[800],
                                onPressed: () {
                                  //here we will add the functionality of the play button
                                  if (!playing) {
                                    //now let's play the song
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
                                icon: Icon(
                                  playBtn,
                                ),
                              ),
                              IconButton(
                                iconSize: 45.0,
                                color: Colors.blue,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.skip_next,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Tela Dois

            Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/FundoTeste.jpg'),
                      fit: BoxFit.cover)),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 400.0,
                      height: 100.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.transparent)),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.blue.shade100,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(32.0))),
                                contentPadding: EdgeInsets.only(
                                    top: 10.0, left: 10.0, right: 10.0),
                                title: new Text(
                                  "Meditação",
                                  textAlign: TextAlign.center,
                                ),
                                content: new Text(
                                  "Atingindo áreas cerebrais ligadas a foco e concentração, a técnica deve ser aperfeiçoada com o tempo, ou seja, necessita de treino, adquirir o controle de pensamentos por um longo período é complicado e demorado. A prática consiste em sentar se no chão ou em uma cadeira de maneira confortável, se concentrando apenas na respiração, existe a possibilidade de ser feito em um grupo, nesses casos pode haver um guia, que passará instruções de como se portar em cada momento. Essa prática é comumente usada para focar apenas em si mesmo, geralmente antes de provas, entrevistas e momentos de pressão causados pelo trabalho, algumas profissões exigem mais desta prática, como, velejadores, mineradores, astronautas e professores, já em praticantes mais recorrentes é comum que seja separado horas diárias para a meditação",
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Ok"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        padding: EdgeInsets.all(10.0),
                        color: Colors.blue.shade200,
                        textColor: Colors.white,
                        child: Text(
                          'Saiba mais sobre meditação!!',
                          style: TextStyle(fontSize: 28.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                                image: new AssetImage('assets/Med1.png'),
                                fit: BoxFit.cover)),
                      ),
                    )
                  ],
                ),
              )),
            ),
          ])),
    ));
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    _player.durationHandler = (d) {
      setState(() {
        musicPeso = d;
      });
    };

    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicPeso.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }
}
