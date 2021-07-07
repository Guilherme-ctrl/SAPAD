import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcompPage extends StatefulWidget {
  @override
  _AcompPageState createState() => _AcompPageState();
}

class _AcompPageState extends State<AcompPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  late String emailParceiro = "";
  late int medit = 1;
  late int music = 1;
  late int cromo = 1;

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Acompanhamento",
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(children: [
            //Card 1
            Padding(
              padding: EdgeInsets.all(0),
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextField(
                                      autofocus: false,
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 30),
                                      decoration: InputDecoration(
                                        labelText:
                                            "Insira o E-mail de seu parceiro:",
                                        labelStyle: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      controller: myController,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Visibility(
              child: Padding(
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
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              color: Colors.black38,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Meditação:"),
                                      Text(medit.toString()),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              visible: emailParceiro.isEmpty ? false : true,
            ),
            Visibility(
              child: Padding(
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
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              color: Colors.black38,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Cromoterapia:"),
                                      Text(cromo.toString()),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              visible: emailParceiro.isEmpty ? false : true,
            ),
            Visibility(
              child: Padding(
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
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              color: Colors.black38,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Musicoterapia:"),
                                      Text(music.toString()),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              visible: emailParceiro.isEmpty ? false : true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0, right: 40),
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.play_circle,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    onPressed: () {
                      setState(() {
                        emailParceiro = myController.text;
                        readFirebase();
                      });
                    },
                  ),
                )
              ],
            )
          ]),
        ));
  }

  readFirebase() async {
    var songs = await FirebaseFirestore.instance
        .collection(emailParceiro.toString())
        .doc('Stats')
        .get();
    setState(() {
      medit = songs.data()?['contMedit'];
      cromo = songs.data()?['contCromo'];
      music = songs.data()?['contMusic'];
    });
  }
}
