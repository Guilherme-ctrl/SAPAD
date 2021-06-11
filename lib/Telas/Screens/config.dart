import 'package:flutter/material.dart';
import 'package:sapad_v3/Telas/HomeScreens/home.dart';
import 'package:sapad_v3/main.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool _music = true;
  bool _cromo = true;
  bool _medit = true;

  bool _edited = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              "Configurações",
              style: TextStyle(fontSize: 20.0),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.black87,
          body: ListView(children: [
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
                            _edited = true;
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
                            _edited = true;
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
                            _edited = true;
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
                padding: EdgeInsets.only(bottom: 15.0),
                child: GestureDetector(
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
                                "Salvar",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: _tapped)),
          ])),
    );
  }

  _tapped() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ControlPage()));
  }

  Future<bool> _requestPop() {
    if (_edited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as alterações serão perdidas."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
