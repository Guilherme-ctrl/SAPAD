import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import './Chat.dart';
import 'helper/helper.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  final bool med;
  final bool ansi;
  final bool raiva;
  final bool triste;
  final bool stress;

  const HomePage(
      {Key key, this.med, this.ansi, this.raiva, this.triste, this.stress})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _med = true;
  bool _ansi = false;
  bool _raiva = false;
  bool _triste = false;
  bool _stress = false;

  @override
  Widget build(BuildContext context) {
    @override
    // ignore: unused_element
    void initState() {
      _med = widget.med;
      _ansi = widget.ansi;
      _raiva = widget.raiva;
      _stress = widget.stress;
      _triste = widget.triste;
      super.initState();
    }

    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Helper(
            med: _med,
            ansi: _ansi,
            raiva: _raiva,
            triste: _triste,
            stress: _stress),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              backgroundColor: Colors.blue.shade900,
              centerTitle: true,
              title: Text(
                'S.A.P.A.D.',
                style: TextStyle(fontSize: 40.0, fontFamily: 'hind'),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                      icon: Icon(
                        MdiIcons.chat,
                        size: 40.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage()));
                      }),
                )
              ],
            )),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/FundoTeste.jpg'),
                    fit: BoxFit.cover)),
            child: ListView(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                  child: Container(
                    height: 70.0,
                    decoration: new BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 5.0, left: 10.0, right: 10.0),
                          child: Text(
                            'Como você está se sentindo hoje?',
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                  child: Container(
                    height: 70.0,
                    decoration: new BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                bottom: 10.0,
                                top: 15.0),
                            child: Text(
                              'Escolha uma das cores indicadas e procure, além de olhar a imagem, colocar a cor em seu ambiente',
                              style: TextStyle(fontSize: 20.0),
                            ))
                      ],
                    ),
                  ),
                ),

                //Medo

                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                      height: 60.0,
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CheckboxListTile(
                            title: Text(
                              'Medo',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            activeColor: Colors.yellow,
                            value: _med,
                            onChanged: (bool _newmed) {
                              setState(() {
                                _med = _newmed;
                              });
                            },
                          ),
                        ],
                      )),
                ),

                //Raiva

                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                      height: 60.0,
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CheckboxListTile(
                            title: Text(
                              'Raiva',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            activeColor: Colors.yellow,
                            value: _raiva,
                            onChanged: (bool _newraiva) {
                              setState(() {
                                _raiva = _newraiva;
                              });
                            },
                          ),
                        ],
                      )),
                ),

                //Estress

                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                      height: 60.0,
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CheckboxListTile(
                            title: Text(
                              'Estresse',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            activeColor: Colors.yellow,
                            value: _stress,
                            onChanged: (_newstress) {
                              setState(() {
                                _stress = _newstress;
                              });
                            },
                          ),
                        ],
                      )),
                ),

                //Tristeza

                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                      height: 60.0,
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CheckboxListTile(
                            title: Text(
                              'Tristeza',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            activeColor: Colors.yellow,
                            value: _triste,
                            onChanged: (_newtriste) {
                              setState(() {
                                _triste = _newtriste;
                              });
                            },
                          ),
                        ],
                      )),
                ),

                //Ansiedade

                Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                  child: Container(
                      height: 60.0,
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CheckboxListTile(
                            title: Text(
                              'Ansiedade',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            activeColor: Colors.yellow,
                            value: _ansi,
                            onChanged: (_newansi) {
                              setState(() {
                                _ansi = _newansi;
                              });
                            },
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }

/*   bool _cMedo() {
    _med = true;
    CromoPage(medo: _med);
    return true;
  }

  _cAnsi() {
    _ansi = true;
    CromoPage(ansi: _ansi);
  }

  _cTriste() {
    _triste = true;
    CromoPage(triste: _triste);
  }

  _cRaiva() {
    _raiva = true;
    CromoPage(raiva: _raiva);
  }

  _cStress() {
    _stress = true;
    CromoPage(stress: _stress);
  } */
}
