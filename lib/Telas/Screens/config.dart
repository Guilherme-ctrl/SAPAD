import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  String? _url;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Configurações",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: Column(children: [
        //Card 1
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            color: Colors.black38,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Musicoterapia Personalizada",
                      style: GoogleFonts.merriweather(
                        textStyle: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      autofocus: true,
                      style: TextStyle(color: Colors.blue, fontSize: 30),
                      decoration: InputDecoration(
                        labelText: "URL",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      controller: myController,
                    ),
                  ],
                )),
          ),
        ),
        //Card 2
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            color: Colors.black38,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Meditação Personalizada",
                      style: GoogleFonts.merriweather(
                        textStyle: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      autofocus: true,
                      style: TextStyle(color: Colors.blue, fontSize: 30),
                      decoration: InputDecoration(
                        labelText: "URL",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      controller: myController,
                    ),
                  ],
                )),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              _url = myController.text;
            },
            child: Icon(Icons.save),
          ),
        )
      ]),
    );
  }
}
