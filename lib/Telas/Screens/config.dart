import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  String? _urlmusic;
  String? _urlmedit;
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  void initState() {
    super.initState();
    readFirebase();
  }

  readFirebase() async {
    var songs = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Songs')
        .get();
    _urlmedit = songs.data()?['video'];
    _urlmusic = songs.data()?['music'];
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          //Card 1
          Card(
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
                        labelText: _urlmusic.toString(),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      controller: myController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.save,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _urlmusic = myController.text;
                            db
                                .collection(user.email.toString())
                                .doc("Songs")
                                .update({"music": _urlmusic});
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(height: 5),
          //Card 2
          Card(
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
                      labelText: _urlmedit.toString(),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    controller: myController2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.save,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                        setState(() {
                          _urlmedit = myController2.text;

                          db
                              .collection(user.email.toString())
                              .doc("001")
                              .update({"video": _urlmedit});
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
