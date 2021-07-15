import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/FireBase/register_firebase.dart';
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
  late int contMedit = 0;
  late int contMeditmed = 0;
  late int contMeditansi = 0;
  late int contMeditraiva = 0;
  late int contMeditstress = 0;
  late int contMedittriste = 0;
  late int contCromo = 0;
  late int contCromomed = 0;
  late int contCromoansi = 0;
  late int contCromoraiva = 0;
  late int contCromostress = 0;
  late int contCromotriste = 0;
  late int contMusic = 0;
  late int contMusicmed = 0;
  late int contMusicansi = 0;
  late int contMusicraiva = 0;
  late int contMusicstress = 0;
  late int contMusictriste = 0;
  bool? _med = false;
  bool? _ansi = false;
  bool? _triste = false;
  bool? _raiva = false;
  bool? _stress = false;

  List<Emote> emote = [];
  @override
  void initState() {
    _readData();
    readFirebase();
    super.initState();
  }

  readFirebase() async {
    var tec = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    contCromo = tec.data()?['contCromo'];
    contMedit = tec.data()?['contMedit'];
    contMusic = tec.data()?['contMusic'];
    contMeditansi = tec.data()?['contMeditansi'];
    contMeditmed = tec.data()?['contMeditmed'];
    contMeditraiva = tec.data()?['contMeditraiva'];
    contMeditstress = tec.data()?['contMeditstress'];
    contMedittriste = tec.data()?['contMedittriste'];
    contCromoansi = tec.data()?['contCromoansi'];
    contCromomed = tec.data()?['contCromomed'];
    contCromoraiva = tec.data()?['contCromoraiva'];
    contCromostress = tec.data()?['contCromostress'];
    contCromotriste = tec.data()?['contCromotriste'];
    contMusicansi = tec.data()?['contMusicansi'];
    contMusicmed = tec.data()?['contMusicmed'];
    contMusicraiva = tec.data()?['contMusicraiva'];
    contMusicstress = tec.data()?['contMusicstress'];
    contMusictriste = tec.data()?['contMusictriste'];
  }

  bool? _music = true;
  bool? _cromo = true;
  bool? _medit = true;
  bool? isChanged = false;

  IconData _seta = Icons.keyboard_arrow_up;

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  // ignore: unused_field
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
      backgroundColor: Colors.black87,
      drawer: Drawer(
          child: Container(
        color: Colors.black45,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 302.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Column(
                  children: <Widget>[
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
                              db
                                  .collection(user.email.toString())
                                  .doc("Home")
                                  .update({
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
                              db
                                  .collection(user.email.toString())
                                  .doc("Home")
                                  .update({
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
                              db
                                  .collection(user.email.toString())
                                  .doc("Home")
                                  .update({
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
            //teste
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.settings),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConfigPage()));
                                  },
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.logout),
                                  onPressed: () {
                                    final provider =
                                        Provider.of<GoogleSignInProvider>(
                                            context,
                                            listen: false);
                                    provider.logout();
                                  },
                                )
                              ],
                            ),
                          ],
                        )),
                      ),
                    ))),
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
                color: Colors.white,
              ),
              onPressed: () => _scaffoldState.currentState!.openDrawer(),
            ),
          ),

          //Card Como você está hoje
          Card(
              color: Colors.black54,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Como você esta hoje?",
                      style: GoogleFonts.lora(
                          textStyle: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      )),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),

          //CheckBox Emoções
          Card(
            color: Colors.black54,
            shadowColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //Medo
                  CheckboxListTile(
                    title: Text(
                      'Medo',
                      style: GoogleFonts.lora(
                          textStyle: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      )),
                    ),
                    activeColor: Colors.red,
                    value: _med,
                    onChanged: (bool? _newmed) {
                      setState(() {
                        _med = _newmed;
                        isChanged = _med;
                        updateFirebase("Emotion", "med", _med);
                      });
                      _saveData();
                    },
                  ),
                  //Ansiedade
                  CheckboxListTile(
                    title: Text(
                      'Ansiedade',
                      style: GoogleFonts.lora(
                          textStyle: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      )),
                    ),
                    activeColor: Colors.red,
                    value: _ansi,
                    onChanged: (bool? _newansi) {
                      setState(() {
                        _ansi = _newansi!;
                        isChanged = _ansi;
                        updateFirebase("Emotion", "ansi", _ansi);
                      });
                      _saveData();
                    },
                  ),
                  //Tristeza
                  CheckboxListTile(
                    title: Text(
                      'Tristeza',
                      style: GoogleFonts.lora(
                          textStyle: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      )),
                    ),
                    activeColor: Colors.red,
                    value: _triste,
                    onChanged: (bool? _newtriste) {
                      setState(() {
                        _triste = _newtriste;
                        isChanged = _triste;
                        updateFirebase("Emotion", "triste", _triste);
                      });
                      _saveData();
                    },
                  ),
                  //Raiva
                  CheckboxListTile(
                    title: Text(
                      'Raiva',
                      style: GoogleFonts.lora(
                          textStyle: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      )),
                    ),
                    activeColor: Colors.red,
                    value: _raiva,
                    onChanged: (bool? _newraiva) {
                      setState(() {
                        _raiva = _newraiva;
                        isChanged = _raiva;
                        updateFirebase("Emotion", "raiva", _raiva);
                      });
                      _saveData();
                    },
                  ),
                  //Estresse
                  CheckboxListTile(
                    title: Text(
                      'Estresse',
                      style: GoogleFonts.lora(
                          textStyle: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      )),
                    ),
                    activeColor: Colors.red,
                    value: _stress,
                    onChanged: (bool? _newstress) {
                      setState(() {
                        _stress = _newstress;
                        isChanged = _stress;
                        updateFirebase("Emotion", "stress", _stress);
                      });
                      _saveData();
                    },
                  ),
                ],
              ),
            ),
          ),

          //Card Terapias
          GestureDetector(
            child: Card(
                color: Colors.black54,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Clique aqui para iescolher uma terapia!!",
                        style: GoogleFonts.lora(
                            textStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        )),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3),
                      Container(child: Icon(_seta, size: 70, color: Colors.red))
                    ],
                  ),
                )),
            onTap: () {
              Future.delayed(Duration.zero, () {
                _showEmotion(context);
              });
            },
          ),

          //Carousel
          Padding(
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
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
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
                        return Builder(builder: (BuildContext context) {
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
          ),
        ],
      ),
    );
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
    _prefs.setBool('_isChanged', isChanged!);
  }

  _readData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _med = _prefs.getBool('_med') ?? false;
      _ansi = _prefs.getBool('_ansi') ?? false;
      _stress = _prefs.getBool('_stress') ?? false;
      _raiva = _prefs.getBool('_raiva') ?? false;
      _triste = _prefs.getBool('_triste') ?? false;
      isChanged = _prefs.getBool('_isChanged') ?? false;
      _music = _prefs.getBool('_music') ?? true;
      _medit = _prefs.getBool('_medit') ?? true;
      _cromo = _prefs.getBool('_cromo') ?? true;
    });
  }

  _showEmotion(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            backgroundColor: Colors.black87,
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                    color: Colors.grey,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
                      //Meditação
                      Visibility(
                        child: ListTile(
                            leading: Icon(MdiIcons.headHeart,
                                size: 50, color: Colors.red),
                            title: Text(
                              "Meditação",
                              style: GoogleFonts.lora(
                                  textStyle: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              )),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              if (isChanged == true) {
                                if (_med == true &&
                                    _raiva == true &&
                                    _triste == true &&
                                    _ansi == true &&
                                    _stress == true) {
                                  contMeditansi++;
                                  contMeditmed++;
                                  contMeditraiva++;
                                  contMeditstress++;
                                  contMedittriste++;
                                  updateFirebase("Stats", "contMeditraiva",
                                      contMeditraiva);
                                  updateFirebase(
                                      "Stats", "contMeditmed", contMeditmed);
                                  updateFirebase("Stats", "contMeditstress",
                                      contMeditstress);
                                  updateFirebase(
                                      "Stats", "contMeditansi", contMeditansi);
                                  updateFirebase("Stats", "contMedittriste",
                                      contMedittriste);
                                } else if (_med == true) {
                                  contMeditmed++;
                                  updateFirebase(
                                      "Stats", "contMeditmed", contMeditmed);
                                }
                                if (_raiva == true) {
                                  contMeditraiva++;
                                  updateFirebase("Stats", "contMeditraiva",
                                      contMeditraiva);
                                }
                                if (_triste == true) {
                                  contMedittriste++;
                                  updateFirebase("Stats", "contMedittriste",
                                      contMedittriste);
                                }
                                if (_stress == true) {
                                  contMeditstress++;
                                  updateFirebase("Stats", "contMeditstress",
                                      contMeditstress);
                                }
                                if (_ansi == true) {
                                  contMeditansi++;
                                  updateFirebase(
                                      "Stats", "contMeditansi", contMeditansi);
                                }
                                contMedit++;
                                updateFirebase("Stats", "contMedit", contMedit);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MeditationPage()));
                              }
                            }),
                        visible:
                            _medit == true && isChanged == true ? true : false,
                      ),

                      //Cromoterapia
                      Visibility(
                        child: ListTile(
                            leading: Icon(MdiIcons.palette,
                                size: 50, color: Colors.red),
                            title: Text(
                              "Cromoterapia",
                              style: GoogleFonts.lora(
                                  textStyle: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              )),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              if (isChanged == true) {
                                if (_med == true &&
                                    _raiva == true &&
                                    _triste == true &&
                                    _ansi == true &&
                                    _stress == true) {
                                  contCromoansi++;
                                  contCromomed++;
                                  contCromoraiva++;
                                  contCromostress++;
                                  contCromotriste++;
                                  updateFirebase("Stats", "contCromoraiva",
                                      contCromoraiva);
                                  updateFirebase(
                                      "Stats", "contCromomed", contCromomed);
                                  updateFirebase("Stats", "contCromostress",
                                      contCromostress);
                                  updateFirebase(
                                      "Stats", "contCromoansi", contCromoansi);
                                  updateFirebase("Stats", "contCromotriste",
                                      contCromotriste);
                                } else if (_med == true) {
                                  contCromomed++;
                                  updateFirebase(
                                      "Stats", "contCromomed", contCromomed);
                                }
                                if (_raiva == true) {
                                  contCromoraiva++;
                                  updateFirebase("Stats", "contCromoraiva",
                                      contCromoraiva);
                                }
                                if (_triste == true) {
                                  contCromotriste++;
                                  updateFirebase("Stats", "contCromotriste",
                                      contCromotriste);
                                }
                                if (_stress == true) {
                                  contCromostress++;
                                  updateFirebase("Stats", "contCromostress",
                                      contCromostress);
                                }
                                if (_ansi == true) {
                                  contCromoansi++;
                                  updateFirebase(
                                      "Stats", "contCromoansi", contCromoansi);
                                }
                                contCromo++;
                                updateFirebase("Stats", "contCromo", contCromo);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CromoPage(
                                            ansi: _ansi,
                                            medo: _med,
                                            raiva: _raiva,
                                            stress: _stress,
                                            triste: _triste,
                                            isMarket: isChanged)));
                              }
                            }),
                        visible:
                            _cromo == true && isChanged == true ? true : false,
                      ),
                      //Musicoterapia
                      Visibility(
                        child: ListTile(
                            leading: Icon(MdiIcons.musicBox,
                                size: 50, color: Colors.red),
                            title: Text(
                              "Musicoterapia",
                              style: GoogleFonts.lora(
                                  textStyle: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              )),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              if (isChanged == true) {
                                if (_med == true &&
                                    _raiva == true &&
                                    _triste == true &&
                                    _ansi == true &&
                                    _stress == true) {
                                  contMusicansi++;
                                  contMusicmed++;
                                  contMusicraiva++;
                                  contMusicstress++;
                                  contMedittriste++;
                                  updateFirebase("Stats", "contMusicraiva",
                                      contMusicraiva);
                                  updateFirebase(
                                      "Stats", "contMusicmed", contMusicmed);
                                  updateFirebase("Stats", "contMusicstress",
                                      contMusicstress);
                                  updateFirebase(
                                      "Stats", "contMusicansi", contMusicansi);
                                  updateFirebase("Stats", "contMusictriste",
                                      contMusictriste);
                                } else if (_med == true) {
                                  contMusicmed++;
                                  updateFirebase(
                                      "Stats", "contMusicmed", contMusicmed);
                                  if (_raiva == true) {
                                    contMusicraiva++;
                                    updateFirebase("Stats", "contMusicraiva",
                                        contMusicraiva);
                                    if (_triste == true) {
                                      contMusictriste++;
                                      updateFirebase("Stats", "contMusictriste",
                                          contMusictriste);
                                      if (_stress == true) {
                                        contMusicstress++;
                                        updateFirebase("Stats",
                                            "contMusicstress", contMusicstress);
                                        if (_ansi == true) {
                                          contMusicansi++;
                                          updateFirebase("Stats",
                                              "contMusicansi", contMusicansi);
                                        }
                                      }
                                    }
                                  }
                                }
                                contMusic++;
                                updateFirebase("Stats", "contMusic", contMusic);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MusicPage()));
                              }
                            }),
                        visible:
                            _music == true && isChanged == true ? true : false,
                      ),
                      //Card Alerta
                      Visibility(
                        child: ListTile(
                          leading:
                              Icon(MdiIcons.alert, size: 50, color: Colors.red),
                          title: Text(
                            "Você precisa selecionar uma emoção",
                            style: GoogleFonts.lora(
                                textStyle: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                            )),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        visible: isChanged == true ? false : true,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
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
