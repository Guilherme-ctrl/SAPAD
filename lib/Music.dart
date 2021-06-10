import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'helper/helper.dart';

class MusicPage extends StatefulWidget {
  final bool med;
  final bool ansi;
  final bool raiva;
  final bool triste;
  final bool stress;

  const MusicPage(
      {Key key, this.med, this.ansi, this.raiva, this.triste, this.stress})
      : super(key: key);
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
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
                backgroundColor: Colors.grey[600],
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
            //Tela Um

            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Colors.black87,
                    Colors.yellow[400],
                    Colors.yellow[100]
                  ])),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: Container(
                        width: 400.0,
                        height: 200.0,
                        decoration: new BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0),
                              bottomLeft: const Radius.circular(40.0),
                              bottomRight: const Radius.circular(40.0),
                            )),
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  image: new AssetImage('assets/Guitar.png'),
                                  fit: BoxFit.fitHeight)),
                        ),
                      )),
                  Row(
                    children: [
                      //Coluna 1

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Botão Musica 1
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 10.0, left: 25.0, right: 50.0),
                              child: SizedBox(
                                width: 140.0,
                                height: 100.0,
                                child: ButtonTheme(
                                  minWidth: 50.0,
                                  height: 20.0,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Colors.transparent)),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.grey[850],
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(32.0))),
                                            contentPadding: EdgeInsets.only(
                                                top: 10.0,
                                                left: 10.0,
                                                right: 10.0),
                                            title: new Text(
                                              "Piano",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            content: new Text("Musica Nome",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    iconSize: 45.0,
                                                    color: Colors.yellow,
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.skip_previous,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    iconSize: 62.0,
                                                    color: Colors.yellow,
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
                                                          playBtn =
                                                              Icons.play_arrow;
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
                                                    color: Colors.yellow,
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.skip_next,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              FlatButton(
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
                                    color: Colors.grey[850],
                                    textColor: Colors.white,
                                    child: Column(
                                      children: [
                                        Icon(MdiIcons.piano,
                                            size: 60.0, color: Colors.yellow),
                                        Text('Piano',
                                            style: TextStyle(fontSize: 20.0))
                                      ],
                                    ),
                                  ),
                                ),
                              )),

                          //Botão Musica 2

                          Padding(
                            padding: EdgeInsets.only(
                                top: 70.0, left: 25.0, right: 50.0),
                            child: SizedBox(
                              width: 140.0,
                              height: 100.0,
                              child: ButtonTheme(
                                minWidth: 20.0,
                                height: 20.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.grey[850],
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0))),
                                          contentPadding: EdgeInsets.only(
                                              top: 10.0,
                                              left: 10.0,
                                              right: 10.0),
                                          title: new Text("Violão",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          content: new Text("Musica Nome",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  iconSize: 45.0,
                                                  color: Colors.yellow,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.skip_previous,
                                                  ),
                                                ),
                                                IconButton(
                                                  iconSize: 62.0,
                                                  color: Colors.yellow,
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
                                                        playBtn =
                                                            Icons.play_arrow;
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
                                                  color: Colors.yellow,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.skip_next,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FlatButton(
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
                                  color: Colors.grey[850],
                                  textColor: Colors.white,
                                  child: Column(
                                    children: [
                                      Icon(MdiIcons.guitarAcoustic,
                                          size: 60.0, color: Colors.yellow),
                                      Text('Violão',
                                          style: TextStyle(fontSize: 20.0))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //Coluna 2

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //Botão Musica 3
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 25.0, right: 25.0),
                            child: SizedBox(
                              width: 140.0,
                              height: 100.0,
                              child: ButtonTheme(
                                minWidth: 50.0,
                                height: 50.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.grey[850],
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0))),
                                          contentPadding: EdgeInsets.only(
                                              top: 10.0,
                                              left: 10.0,
                                              right: 10.0),
                                          title: new Text("Violino",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          content: new Text("Musica Nome",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  iconSize: 45.0,
                                                  color: Colors.yellow,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.skip_previous,
                                                  ),
                                                ),
                                                IconButton(
                                                  iconSize: 62.0,
                                                  color: Colors.yellow,
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
                                                        playBtn =
                                                            Icons.play_arrow;
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
                                                  color: Colors.yellow,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.skip_next,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FlatButton(
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
                                  color: Colors.grey[850],
                                  textColor: Colors.white,
                                  child: Column(
                                    children: [
                                      Icon(MdiIcons.violin,
                                          size: 60.0, color: Colors.yellow),
                                      Text(
                                        'Violino',
                                        style: TextStyle(fontSize: 20.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Botão Musica 4

                          Padding(
                            padding: EdgeInsets.only(
                                top: 70.0, left: 25.0, right: 25.0),
                            child: SizedBox(
                              width: 140.0,
                              height: 100.0,
                              child: ButtonTheme(
                                minWidth: 20.0,
                                height: 20.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.transparent)),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.grey[850],
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0))),
                                          contentPadding: EdgeInsets.only(
                                              top: 10.0,
                                              left: 10.0,
                                              right: 10.0),
                                          title: new Text("Musica Classica",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          content: new Text("Musica Nome",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  iconSize: 45.0,
                                                  color: Colors.yellow,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.skip_previous,
                                                  ),
                                                ),
                                                IconButton(
                                                  iconSize: 62.0,
                                                  color: Colors.yellow,
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
                                                        playBtn =
                                                            Icons.play_arrow;
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
                                                  color: Colors.yellow,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.skip_next,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FlatButton(
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
                                  color: Colors.grey[850],
                                  textColor: Colors.white,
                                  child: Column(
                                    children: [
                                      Icon(Icons.music_note,
                                          size: 60.0, color: Colors.yellow),
                                      Text('Musica Classica',
                                          style: TextStyle(fontSize: 20.0))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, right: 18.0),
                    child: Container(
                        width: 300.0,
                        height: 180.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientIcon(
                              Icons.multitrack_audio_outlined,
                              170,
                              LinearGradient(
                                  colors: <Color>[
                                    Colors.yellow,
                                    Colors.yellow,
                                    Colors.black,
                                    Colors.black,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),

            // Tela Dois

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
                                  "A musicoterapia é uma junção da arte com a ciência, nos dias atuais ela é muito utilizada no mundo inteiro, a música sempre foi um influenciador do homem, Platão afirmava que “a música é o remédio da alma”, também é inegável o fato de que a música tem efeitos inexplicáveis como tranquilidade, diminuição do estresse, bem-estar, equilíbrio e tratamento de doenças psicossomáticas",
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
                          'Saiba mais sobre Musicoterapia!!',
                          style: TextStyle(fontSize: 27.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(
                        width: 300.0,
                        height: 400.0,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                                image: new AssetImage('assets/Music.png'),
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

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon,
    this.size,
    this.gradient,
  );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
