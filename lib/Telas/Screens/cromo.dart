import 'package:flutter/material.dart';
import 'package:sapad_v3/games/game_azul.dart';

class CromoPage extends StatefulWidget {
  final bool medo;
  final bool ansi;
  final bool triste;
  final bool stress;
  final bool raiva;
  final bool isMarket;

  const CromoPage(
      {Key key,
      this.medo,
      this.ansi,
      this.triste,
      this.stress,
      this.raiva,
      this.isMarket})
      : super(key: key);

  @override
  _CromoPageState createState() => _CromoPageState();
}

class _CromoPageState extends State<CromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Cromoterapia",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          //Card 1
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
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
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/Cromoterapia.png"))),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Saiba sobre\n CROMOTERAPIA",
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
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
              onTap: () {
                _requestPopInfo(context);
              },
            ),
          ),

          //Card Alerta
          Visibility(
            child: Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.info_outline,
                          size: 200.0, color: Colors.white60),
                    ),
                    Text(
                      "Para ter acesso as terapias você precisa selecionar seu estado atual na pagina principal",
                      style: TextStyle(color: Colors.white60, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            visible: widget.isMarket == true ? false : true,
          ),
          //Card 2
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: widget.medo == true ||
                          widget.stress == true ||
                          widget.ansi == true
                      ? Colors.blue
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Azul",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SnakeGameAzul()));
                },
              ),
            ),
            visible: widget.medo == true ||
                    widget.stress == true ||
                    widget.ansi == true
                ? true
                : false,
          ),
          //Card 3
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Vermelho",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  _requestPopVer(context);
                },
              ),
            ),
            visible: widget.triste == true ? true : false,
          ),
          //Card 4
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: widget.medo == true ||
                          widget.raiva == true ||
                          widget.triste == true ||
                          widget.ansi == true
                      ? Colors.yellow
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Amarelo",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  _requestPopAma(context);
                },
              ),
            ),
            visible: widget.medo == true ||
                    widget.raiva == true ||
                    widget.triste == true ||
                    widget.ansi == true
                ? true
                : false,
          ),
          //Card 5
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: widget.stress == true || widget.raiva == true
                      ? Colors.purple
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Roxo",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  _requestPopRx(context);
                },
              ),
            ),
            visible:
                widget.stress == true || widget.raiva == true ? true : false,
          ),
          //Card 6
          Visibility(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Card(
                  color: widget.triste == true ||
                          widget.ansi == true ||
                          widget.raiva == true
                      ? Colors.green
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Verde",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  _requestPopVe(context);
                },
              ),
            ),
            visible: widget.triste == true ||
                    widget.ansi == true ||
                    widget.raiva == true
                ? true
                : false,
          ),
        ],
      ),
    );
  }

  _requestPopInfo(context) {
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
                child: Text("Explicação sobre musicoterapia"),
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

  _requestPopAzul(context) {
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
                child: Image(image: AssetImage('assets/Azul.jpg')),
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

  _requestPopVer(context) {
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
                child: Image(image: AssetImage('assets/Vermelho.jpg')),
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

  _requestPopAma(context) {
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
                child: Image(image: AssetImage('assets/Amarelo.jpg')),
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

  _requestPopRx(context) {
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
                child: Image(image: AssetImage('assets/roxo.jpg')),
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

  _requestPopVe(context) {
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
                child: Image(image: AssetImage('assets/Verde.jpg')),
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
}
