import 'package:flutter/material.dart';
import 'package:sapad_v3/Telas/Screens/cromo.dart';
import 'package:sapad_v3/Telas/Screens/meditation.dart';
import 'package:sapad_v3/Telas/Screens/musicoterapia.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _med = false;
  bool _ansi = false;
  bool _triste = false;
  bool _raiva = false;
  bool _stress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "SAPAD",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: ListView(
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
        children: [
          //Card 1

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
                        "Como você está hoje?",
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
                          'Medo',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                        activeColor: Colors.purple[200],
                        value: _med,
                        onChanged: (bool _newmed) {
                          setState(() {
                            _med = _newmed;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.0),
                      child: CheckboxListTile(
                        title: Text(
                          'Triste',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                        activeColor: Colors.purple[200],
                        value: _triste,
                        onChanged: (bool _newtriste) {
                          setState(() {
                            _triste = _newtriste;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.0),
                      child: CheckboxListTile(
                        title: Text(
                          'Ansioso (a)',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                        activeColor: Colors.purple[200],
                        value: _ansi,
                        onChanged: (bool _newansi) {
                          setState(() {
                            _ansi = _newansi;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.0),
                      child: CheckboxListTile(
                        title: Text(
                          'Estressado (a)',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                        activeColor: Colors.purple[200],
                        value: _stress,
                        onChanged: (bool _newstress) {
                          setState(() {
                            _stress = _newstress;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.0),
                      child: CheckboxListTile(
                        title: Text(
                          'Com Raiva',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                        activeColor: Colors.purple[200],
                        value: _raiva,
                        onChanged: (bool _newraiva) {
                          setState(() {
                            _raiva = _newraiva;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Card 2

          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: GestureDetector(
              child: SizedBox(
                height: 100.0,
                width: 100.0,
                child: Card(
                  color: Colors.black38,
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
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/Med1.png"))),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Meditação",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 100.0, bottom: 40.0, top: 2.0),
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.airline_seat_flat_angled_rounded,
                                    color: Colors.purple,
                                    size: 30.0,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MeditationPage(
                            medo: _med,
                            ansi: _ansi,
                            raiva: _raiva,
                            stress: _stress,
                            triste: _triste)));
              },
            ),
          ),
          //Card 3

          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: GestureDetector(
              child: SizedBox(
                height: 100.0,
                width: 100.0,
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
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 5, left: 5, right: 35, top: 10),
                              child: Container(
                                width: 55.0,
                                height: 55.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/Cromoterapia.png"))),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Cromoterapia",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 90.0, bottom: 40.0),
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.color_lens,
                                    color: Colors.purple,
                                    size: 30.0,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CromoPage(
                            medo: _med,
                            ansi: _ansi,
                            raiva: _raiva,
                            stress: _stress,
                            triste: _triste)));
              },
            ),
          ),
          //Card 4

          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: GestureDetector(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
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
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 5, left: 5, right: 35, top: 10),
                              child: Container(
                                width: 55.0,
                                height: 55.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("assets/Guitar.png"))),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 25.0, left: 15.0, bottom: 20.0),
                                    child: Text(
                                      "Musicoterapia",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 90.0, bottom: 40.0),
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.music_note,
                                    color: Colors.purple,
                                    size: 30.0,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MusicPage(
                            medo: _med,
                            ansi: _ansi,
                            raiva: _raiva,
                            stress: _stress,
                            triste: _triste)));
              },
            ),
          ),
        ],
      ),
    );
  }
}
