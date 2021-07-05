import 'dart:math';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/Telas/LoginScreens/google_sign_in.dart';
import 'package:sapad_v3/Telas/Screens/config.dart';
import 'package:sapad_v3/Telas/Screens/cromo.dart';
import 'package:sapad_v3/Telas/Screens/meditation.dart';
import 'package:sapad_v3/Telas/Screens/musicoterapia.dart';
import 'package:sapad_v3/helper.dart/setting_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EmoteHelper helper = EmoteHelper();
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  List<Emote> emote = [];
  @override
  void initState() {
    _readData();
    super.initState();
    /* db.collection("Songs").doc("001").set({
      "medit": 'https://www.youtube.com/watch?v=IdGhUk7uJMQ',
      "music": 'https://www.youtube.com/watch?v=w7o_3ME8jHs',
    }); */
  }

  bool? _med = false;
  bool? _ansi = false;
  bool? _triste = false;
  bool? _raiva = false;
  bool? _stress = false;
  bool? _isMarked = false;
  bool _lightMode = false;

  bool? _music = true;
  bool? _cromo = true;
  bool? _medit = true;
  bool _checkBox = false;

  IconData _seta = Icons.keyboard_arrow_up;

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  List cardList = [Item1(), Item2(), Item3(), Item4()];
  List<T?> map<T>(List list, Function handler) {
    List<T?> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: _lightMode == false ? Colors.black87 : Colors.white,
      drawer: Drawer(
          child: Container(
        color: _lightMode == false ? Colors.black45 : Colors.white70,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 302.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: _lightMode == false ? Colors.grey : Colors.white10,
                ),
                child: Column(
                  children: <Widget>[
                    //Carousel
                    /* Padding(
                      padding: EdgeInsets.only(top: 1.0),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 200.0,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  pauseAutoPlayOnTouch: true,
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                                items: cardList.map((card) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Container(
                                        child: Stack(
                                      children: [
                                        Card(
                                          color: Colors.transparent,
                                          child: card,
                                        ),
                                      ],
                                    ));
                                  });
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), */
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    SizedBox(height: 8),
                    Text(
                      user.displayName!,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(height: 8),
                    Text(
                      user.email!,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            //CheckBox Card

            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Container(
                            child: Text(
                          "Praticas",
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0, top: 5.0),
                        child: CheckboxListTile(
                          title: Text(
                            'Meditação',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          activeColor: Colors.purple[200],
                          value: _medit,
                          onChanged: (bool? _newmed) {
                            setState(() {
                              _medit = _newmed;
                              db.collection("Home").doc("001").update({
                                "medit": _medit,
                              });
                              _saveData();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: CheckboxListTile(
                          title: Text(
                            'Cromoterapia',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          activeColor: Colors.purple[200],
                          value: _cromo,
                          onChanged: (bool? _newcromo) {
                            //_edited = true;
                            setState(() {
                              _cromo = _newcromo;
                              db.collection("Home").doc("001").update({
                                "cromo": _cromo,
                              });
                              _saveData();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: CheckboxListTile(
                          title: Text(
                            'Musicoterapia',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          activeColor: Colors.purple[200],
                          value: _music,
                          onChanged: (bool? _newmusic) {
                            //_edited = true;
                            setState(() {
                              _music = _newmusic;
                              db.collection("Home").doc("001").update({
                                "music": _music,
                              });
                              _saveData();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //FeedBack Card

            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          "Envie o seu FEEDBACK\nClicando Aqui!!",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  const url = 'https://tripetto.app/run/67SY85OQH2';
                  abrirUrl(url);
                },
              ),
            ),
            //Setting Card

            Padding(
              padding: EdgeInsets.zero,
              child: GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                          child: Row(
                        children: [
                          Text(
                            'Configurações',
                            style: GoogleFonts.merriweather(
                                textStyle: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 85.0),
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                              )),
                        ],
                      )),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ConfigPage()));
                },
              ),
            ),
            //Logout Card

            Padding(
              padding: EdgeInsets.zero,
              child: GestureDetector(
                child: Card(
                  color: Colors.black38,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                          child: Row(
                        children: [
                          Text(
                            'Sair da Conta',
                            style: GoogleFonts.merriweather(
                                textStyle: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 97.0),
                              child: Icon(
                                Icons.logout,
                                color: Colors.white,
                              )),
                        ],
                      )),
                    ),
                  ),
                ),
                onTap: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
              ),
            )
          ],
        ),
      )),
      body: ListView(
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
        children: [
          //Drawer Button
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(
                Icons.menu,
                color: _lightMode == false ? Colors.white : Colors.black,
              ),
              onPressed: () => _scaffoldState.currentState!.openDrawer(),
            ),
          ),

          //Card 1

          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: GestureDetector(
              child: SizedBox(
                height: 231.0,
                width: 100.0,
                child: Card(
                  color: Colors.black54,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Container(
                            child: Text(
                          "Clique e informe como você esta hoje!!",
                          style: GoogleFonts.merriweather(
                              textStyle: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          textAlign: TextAlign.center,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: Container(
                            child: Text(
                          "Selecione o seu estado atual,\nentão escolha uma das terapias indicadas",
                          style: GoogleFonts.merriweather(
                              textStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                          textAlign: TextAlign.center,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: Container(
                          child: Icon(_seta,
                              size: 70.0, color: Colors.greenAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  if (_checkBox == true) {
                    setState(() {
                      _seta = Icons.keyboard_arrow_down;
                      _checkBox = false;
                      db.collection("Home").doc("001").update({
                        "hide": _checkBox,
                      });
                      _saveData();
                    });
                    // await helper.saveEmote(recEmote);
                  } else {
                    setState(() {
                      _seta = Icons.keyboard_arrow_up;
                      _checkBox = true;
                      db.collection("Home").doc("001").update({
                        "hide": _checkBox,
                      });
                      _saveData();
                    });
                    //await helper.saveEmote(recEmote);
                  }
                  _getAllEmote();
                });
              },
            ),
          ),
          //Card 2

          Visibility(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Card(
                color: Colors.black54,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0, top: 2.0),
                        child: CheckboxListTile(
                          title: Text(
                            'Medo',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          activeColor: Colors.purple[200],
                          value: _med,
                          onChanged: (bool? _newmed) {
                            setState(() {
                              _med = _newmed;
                              _isMarked = _newmed;
                              db.collection("Emotion").doc("001").update({
                                "med": _med,
                              });
                              _saveData();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: CheckboxListTile(
                          title: Text(
                            'Triste',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          activeColor: Colors.purple[200],
                          value: _triste,
                          onChanged: (bool? _newtriste) {
                            setState(() {
                              _triste = _newtriste;
                              _isMarked = _newtriste;
                              db.collection("Emotion").doc("001").update({
                                "triste": _triste,
                              });
                              _saveData();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: CheckboxListTile(
                          title: Text(
                            'Ansioso (a)',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          activeColor: Colors.purple[200],
                          value: _ansi,
                          onChanged: (bool? _newansi) {
                            setState(() {
                              _ansi = _newansi;
                              _isMarked = _newansi;
                              db.collection("Emotion").doc("001").update({
                                "ansi": _ansi,
                              });
                              _saveData();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.0),
                        child: CheckboxListTile(
                          title: Text(
                            'Estressado (a)',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          activeColor: Colors.purple[200],
                          value: _stress,
                          onChanged: (bool? _newstress) {
                            setState(() {
                              _stress = _newstress;
                              _isMarked = _newstress;
                              setState(() {
                                db.collection("Emotion").doc("001").update({
                                  "stress": _stress,
                                });
                              });

                              _saveData();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: CheckboxListTile(
                          title: Text(
                            'Com Raiva',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          activeColor: Colors.purple[200],
                          value: _raiva,
                          onChanged: (bool? _newraiva) {
                            setState(() {
                              _raiva = _newraiva;
                              db.collection("Emotion").doc("001").update({
                                "raiva": _raiva,
                              });
                              _saveData();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            visible: _checkBox == false ? false : true,
          ),
          //Card 3

          Visibility(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: GestureDetector(
                child: SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Card(
                    color: _medit == true ? Colors.black54 : Colors.grey,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    top: 10.0,
                                    bottom: 10.0,
                                    right: 35),
                                child: Container(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Icon(
                                    MdiIcons.headSnowflakeOutline,
                                    color: Colors.greenAccent,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Meditação",
                                        style: GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.white,
                                        )),
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
                ),
                onTap: () {
                  if (_medit == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MeditationPage(
                                medo: _med,
                                ansi: _ansi,
                                raiva: _raiva,
                                stress: _stress,
                                triste: _triste)));
                  }
                },
              ),
            ),
            visible: _medit == true ? true : false,
          ),
          //Card 4

          Visibility(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: GestureDetector(
                child: SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Card(
                    color: _cromo == true ? Colors.black54 : Colors.grey,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 5, left: 5, right: 35, top: 10),
                                child: Container(
                                    width: 55.0,
                                    height: 55.0,
                                    child: Icon(Icons.palette,
                                        color: Colors.greenAccent, size: 40.0)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Cromoterapia",
                                        style: GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.white,
                                        )),
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
                ),
                onTap: () {
                  if (_cromo == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CromoPage(
                                  medo: _med,
                                  ansi: _ansi,
                                  raiva: _raiva,
                                  stress: _stress,
                                  triste: _triste,
                                  isMarket: _isMarked,
                                )));
                  }
                },
              ),
            ),
            visible: _cromo == true ? true : false,
          ),
          //Card 5

          Visibility(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: GestureDetector(
                child: SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Card(
                    color: _music == true ? Colors.black54 : Colors.grey,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 5, left: 5, right: 35, top: 10),
                                child: Container(
                                  width: 55.0,
                                  height: 55.0,
                                  child: Icon(MdiIcons.guitarPick,
                                      color: Colors.greenAccent, size: 40.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "Musicoterapia",
                                        style: GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.white,
                                        )),
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
                ),
                onTap: () {
                  if (_music == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MusicPage()));
                  }
                },
              ),
            ),
            visible: _music == true ? true : false,
          ),
        ],
      ),
    );
  }

  void _getAllEmote() {
    helper.getAllEmotes().then((list) {
      setState(() {
        emote = list;
      });
    });
  }

  abrirUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _saveData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('_med', _med!);
    _prefs.setBool('_ansi', _ansi!);
    _prefs.setBool('_stress', _stress!);
    _prefs.setBool('_raiva', _raiva!);
    _prefs.setBool('_triste', _triste!);
    _prefs.setBool('_cromo', _cromo!);
    _prefs.setBool('_medit', _medit!);
    _prefs.setBool('_music', _music!);
    _prefs.setBool('_isMarked', _isMarked!);
    _prefs.setBool('_checkBox', _checkBox);
    _prefs.setBool('_lightMode', _lightMode);
  }

  _readData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _med = _prefs.getBool('_med') ?? false;
      _ansi = _prefs.getBool('_ansi') ?? false;
      _stress = _prefs.getBool('_stress') ?? false;
      _raiva = _prefs.getBool('_raiva') ?? false;
      _triste = _prefs.getBool('_triste') ?? false;
      _isMarked = _prefs.getBool('_isMarked') ?? false;
      _checkBox = _prefs.getBool('_checkBox') ?? false;
      _music = _prefs.getBool('_music') ?? true;
      _medit = _prefs.getBool('_medit') ?? true;
      _cromo = _prefs.getBool('_cromo') ?? true;
      _lightMode = _prefs.getBool('_lightMode') ?? false;
    });
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              Image.asset(
                'assets/meditacao.jpg',
                height: 180.0,
                fit: BoxFit.cover,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/meditacao.jpg',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/meditacao.jpg',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/meditacao.jpg',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
