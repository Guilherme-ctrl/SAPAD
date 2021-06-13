import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 100.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          "Tendo em vista os problemas que a ansiedade, depressão e a falta de controle das emoções podem causar nas vidas das pessoas, esse projeto se justifica com a meta de contribuir para a diminuição desses contratempos. Para isso, contará com a combinação de tecnologias leves e técnicas de atenção plena, visando o desenvolvimento de estados mentais mais estáveis, facilitando o controle sobre as emoções. ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
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
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0, right: 35),
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/Logo.png"))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0, right: 35),
                          child: Container(
                            child: Text(
                              "Instituto Federal de Santa Catarina\nCampus Gaspar\nIFSC",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  _ifscPop(context);
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
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 10.0),
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/TechMaker.jpg"))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 90.0, top: 10.0, bottom: 10.0),
                          child: Container(
                            child: Text(
                              "TechMaker\nBlumenau - SC",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  _techPop(context);
                },
              ),
            ),
            //Card 4

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
            //Card 5

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
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          "Encontrou Algum BUG?\nClique Aqui!!",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  abrirGmail();
                },
              ),
            ),
          ],
        ));
  }

  _techPop(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            content: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: Text("Ajudou na elaboração da ideia"),
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

  _ifscPop(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            content: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: Text(
                    "Elaborou os codigos, e aprofundou a pesquisa cientifica"),
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

  abrirGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'pi.ifsc.gaspar@gmail.com',
      query: 'subject=Reportar&body=Detalhe aqui qual bug você encontrou: ',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  abrirUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
