import 'package:flutter/material.dart';

class MeditationPage extends StatelessWidget {
  final bool medo;
  final bool ansi;
  final bool triste;
  final bool stress;
  final bool raiva;

  const MeditationPage(
      {Key key, this.medo, this.ansi, this.triste, this.stress, this.raiva})
      : super(key: key);

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
        body: Column(children: [
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
                                    image: AssetImage("assets/Guitar.png"))),
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
                                    "Saiba sobre\n MUSICOTERAPIA",
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
                _requestPop(context);
              },
            ),
          ),
          //Card 2
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
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 60.0),
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Meditação Guiada",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(100.0)),
                        child: IconButton(
                          iconSize: 50.0,
                          color: Colors.purple,
                          onPressed: () {},
                          icon: Icon(Icons.play_arrow),
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
          ),
          //Card 3
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
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 93.0),
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Sua Meditação",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(100.0)),
                        child: IconButton(
                          iconSize: 50.0,
                          color: Colors.purple,
                          onPressed: () {},
                          icon: Icon(Icons.play_arrow),
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
}
