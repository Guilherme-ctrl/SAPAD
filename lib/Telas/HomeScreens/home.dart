import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapad_v3/Telas/Screens/cromo.dart';
import 'package:sapad_v3/Telas/Screens/meditation.dart';
import 'package:sapad_v3/Telas/Screens/musicoterapia.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  /* final bool music;
  final bool cromo;
  final bool medit;

  const HomePage({Key key, this.music, this.cromo, this.medit})
      : super(key: key);
 */
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _med = false;
  bool _ansi = false;
  bool _triste = false;
  bool _raiva = false;
  bool _stress = false;
  bool _isMarked = false;

  bool _music = true;
  bool _cromo = true;
  bool _medit = true;
  bool _checkBox = true;

  IconData _seta = Icons.keyboard_arrow_up;

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  List cardList = [Item1(), Item2(), Item3(), Item4()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
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
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0)),
                      child: Container(
                          width: 110.0,
                          height: 110.0,
                          child: Image(
                            image: AssetImage('assets/Logo.png'),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
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
                          onChanged: (bool _newmed) {
                            setState(() {
                              _medit = _newmed;
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
                          onChanged: (bool _newcromo) {
                            //_edited = true;
                            setState(() {
                              _cromo = _newcromo;
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
                          onChanged: (bool _newmusic) {
                            //_edited = true;
                            setState(() {
                              _music = _newmusic;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  const url = 'https://www.google.com';
                  abrirUrl(url);
                },
              ),
            ),
            /* ListTile(
              title: Text(
                'Configurações',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfigPage()));
              },
            ), */
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
              onPressed: () => _scaffoldState.currentState.openDrawer(),
            ),
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
                              height: MediaQuery.of(context).size.height * 0.30,
                              width: MediaQuery.of(context).size.width,
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
                    Padding(
                      padding: EdgeInsets.only(top: 150.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(cardList, (index, url) {
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          //Card 1

          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: GestureDetector(
              child: SizedBox(
                height: 230.0,
                width: 100.0,
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
              ),
              onTap: () {
                setState(() {
                  if (_checkBox == true) {
                    _seta = Icons.keyboard_arrow_down;
                    _checkBox = false;
                  } else {
                    _seta = Icons.keyboard_arrow_up;
                    _checkBox = true;
                  }
                });
              },
            ),
          ),
          //Card 2

          Visibility(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.0),
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
                        padding: EdgeInsets.only(bottom: 1.0, top: 2.0),
                        child: CheckboxListTile(
                          title: Text(
                            'Medo',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          activeColor: Colors.purple[200],
                          value: _med,
                          onChanged: (bool _newmed) {
                            setState(() {
                              _med = _newmed;
                              _isMarked = _newmed;
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
                          onChanged: (bool _newtriste) {
                            setState(() {
                              _triste = _newtriste;
                              _isMarked = _newtriste;
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
                          onChanged: (bool _newansi) {
                            setState(() {
                              _ansi = _newansi;
                              _isMarked = _newansi;
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
                          onChanged: (bool _newstress) {
                            setState(() {
                              _stress = _newstress;
                              _isMarked = _newstress;
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
                          onChanged: (bool _newraiva) {
                            setState(() {
                              _raiva = _newraiva;
                              _isMarked = _newraiva;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            visible: _checkBox == true ? true : false,
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
                    color: _medit == true ? Colors.black38 : Colors.grey,
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
                    color: _cromo == true ? Colors.black38 : Colors.grey,
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
                    color: _music == true ? Colors.black38 : Colors.grey,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MusicPage(
                                medo: _med,
                                ansi: _ansi,
                                raiva: _raiva,
                                stress: _stress,
                                triste: _triste)));
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

  abrirUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

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
                'assets/musicoterapia.jpg',
                height: 180.0,
                fit: BoxFit.fill,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

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
            'assets/cromoterapia.jpg',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

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
            'assets/Logo.png',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

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
