import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sapad_v2/main.dart';

import 'helper/helper.dart';

class CromoPage extends StatefulWidget {
  final bool med;
  final bool ansi;
  final bool raiva;
  final bool triste;
  final bool stress;

  const CromoPage(
      {Key key, this.med, this.ansi, this.raiva, this.triste, this.stress})
      : super(key: key);

  @override
  _CromoPageState createState() => _CromoPageState();
}

class _CromoPageState extends State<CromoPage> {
  TabController controller;

  HomePage helper = HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
          bottomNavigationBar: Helper(
              med: widget.med,
              ansi: widget.ansi,
              raiva: widget.raiva,
              triste: widget.triste,
              stress: widget.stress),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: Colors.blue.shade900,
                centerTitle: true,
                title: Text(
                  ' ',
                  style: TextStyle(fontSize: 30.0, fontFamily: 'hind'),
                ),
                bottom: TabBar(
                    unselectedLabelColor: Colors.white38,
                    indicatorColor: Colors.yellow,
                    labelColor: Colors.yellow,
                    controller: controller,
                    tabs: <Widget>[
                      Text(
                        "Pratica",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Text(
                        "O que é?",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ]),
              )),
          body: TabBarView(children: <Widget>[
            //Tela 1

            Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage('assets/FundoTeste.jpg'),
                        fit: BoxFit.cover)),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 10.0),
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
                                  top: 20.0,
                                  bottom: 5.0,
                                  left: 10.0,
                                  right: 10.0),
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
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 10.0),
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
                    //Botões

                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                      child: Container(
                          width: 100.0,
                          height: 250.0,
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
                              Row(
                                children: [
                                  //Coluna 1

                                  Column(
                                    children: [
                                      //Botão 1

                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 20.0,
                                            left: 20.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 70.0,
                                          child: ButtonTheme(
                                            minWidth: 40.0,
                                            height: 50.0,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color:
                                                          Colors.transparent)),
                                              onPressed: _disableA,
                                              padding: EdgeInsets.all(10.0),
                                              color: Colors.yellow,
                                              textColor: Colors.white,
                                              child: Text(
                                                'Amarelo',
                                                style:
                                                    TextStyle(fontSize: 28.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Botão 2
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 20.0,
                                            left: 20.0,
                                            top: 5.0,
                                            bottom: 10.0),
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 70.0,
                                          child: ButtonTheme(
                                            minWidth: 40.0,
                                            height: 50.0,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color:
                                                          Colors.transparent)),
                                              onPressed: _disableAZ,
                                              padding: EdgeInsets.all(10.0),
                                              color: Colors.blue,
                                              textColor: Colors.white,
                                              child: Text(
                                                'Azul',
                                                style:
                                                    TextStyle(fontSize: 28.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  //Coluna 2

                                  Column(
                                    children: [
                                      //Botão 3

                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 20.0,
                                            left: 40.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 70.0,
                                          child: ButtonTheme(
                                            minWidth: 40.0,
                                            height: 50.0,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color:
                                                          Colors.transparent)),
                                              onPressed: _disableV,
                                              padding: EdgeInsets.all(10.0),
                                              color: Colors.green,
                                              textColor: Colors.white,
                                              child: Text(
                                                'Verde',
                                                style:
                                                    TextStyle(fontSize: 28.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Botão 4

                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 20.0,
                                            left: 40.0,
                                            top: 5.0,
                                            bottom: 10.0),
                                        child: SizedBox(
                                          width: 140.0,
                                          height: 70.0,
                                          child: ButtonTheme(
                                            minWidth: 40.0,
                                            height: 50.0,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  side: BorderSide(
                                                      color:
                                                          Colors.transparent)),
                                              onPressed: _disableR,
                                              padding: EdgeInsets.all(10.0),
                                              color: Colors.purple,
                                              textColor: Colors.white,
                                              child: Text(
                                                'Roxo',
                                                style:
                                                    TextStyle(fontSize: 28.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              //Botão 5

                              Padding(
                                padding: EdgeInsets.only(top: 0.0),
                                child: SizedBox(
                                  width: 140.0,
                                  height: 70.0,
                                  child: ButtonTheme(
                                    minWidth: 40.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.transparent)),
                                      onPressed: _disableVa,
                                      padding: EdgeInsets.all(10.0),
                                      color: Colors.red,
                                      textColor: Colors.white,
                                      child: Text(
                                        'Vermelho',
                                        style: TextStyle(fontSize: 28.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                )),

            //Tela 2

            Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/FundoTeste.jpg'),
                      fit: BoxFit.cover)),
              child: ListView(
                children: [
                  Container(
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Botão 1

                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, right: 5.0, left: 5.0),
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 100.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.blue.shade100,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32.0))),
                                        contentPadding: EdgeInsets.only(
                                            top: 10.0, left: 10.0, right: 10.0),
                                        title: new Text(
                                          "Cromoterapia",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: new Text(
                                          "Realizado com aparelhos que emitem luzes, a cromoterapia busca agir diretamente no cérebro incentivando cada região. Cada tonalidade age de maneira distinta no cérebro, por exemplo, de acordo com o artigo “Cromoterapia aplicada na harmonização do emocional intensificando os tratamentos estéticos”, azul tem ligação com ansiedade, estresse e medo, amarelo comansiedade, raiva e medo, verde com estresse, raiva, solidão e tristeza.",
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: <Widget>[
                                          new FlatButton(
                                            child: new Text("Ok"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                padding: EdgeInsets.all(10.0),
                                color: Colors.blue.shade200,
                                textColor: Colors.white,
                                child: Text(
                                  'Saiba mais sobre cromoterapia!!',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                            ),
                          ),

                          //Amarelo

                          Padding(
                            padding:
                                EdgeInsets.only(top: 30, right: 5.0, left: 5.0),
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 60.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.yellow[100],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(60.0))),
                                        contentPadding: EdgeInsets.only(
                                            top: 10.0,
                                            left: 15.0,
                                            right: 15.0,
                                            bottom: 15.0),
                                        title: new Text(
                                          "Amarelo",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: new Text(
                                          "O amarelo é a cor que estimula o intelecto e o sistema nervoso central. Contribui para elevar a criatividade e melhorar o humor. Além disso, na cromoterapia, ela pode ser usada por pessoas quietas e introvertidas que queiram ter um bom relacionamento interpessoal.",
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    },
                                  );
                                },
                                padding: EdgeInsets.all(10.0),
                                color: Colors.yellow,
                                child: Text(
                                  'Ajuda no alivio do MEDO, ANSIEDADE, RAIVA e TRISTEZA\n (Clique para ver mais!)',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          //Azul

                          Padding(
                            padding:
                                EdgeInsets.only(top: 30, right: 5.0, left: 5.0),
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 60.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.blue[100],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(60.0))),
                                        contentPadding: EdgeInsets.only(
                                            top: 10.0,
                                            left: 15.0,
                                            right: 15.0,
                                            bottom: 15.0),
                                        title: new Text(
                                          "Amarelo",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: new Text(
                                          "A cor azul possui propriedades calmantes e tranquilizantes, que atuam no sistema nervoso e em todo o sistema muscular. Por isso, na cromoterapia, essa cor é usada para o tratamento de problemas de sono e insônia ou relacionados ao estresse, ajudando a trazer calma e harmonia ao organismo.",
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    },
                                  );
                                },
                                padding: EdgeInsets.all(10.0),
                                color: Colors.blue,
                                child: Text(
                                  'Ajuda no alivio do MEDO, ANSIEDADE e ESTRESSE\n (Clique para ver mais!)',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          //Verde
                          Padding(
                            padding:
                                EdgeInsets.only(top: 30, right: 5.0, left: 5.0),
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 60.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.green[100],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(60.0))),
                                        contentPadding: EdgeInsets.only(
                                            top: 10.0,
                                            left: 15.0,
                                            right: 15.0,
                                            bottom: 15.0),
                                        title: new Text(
                                          "Verde",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: new Text(
                                          "O verde é a cor que ajuda a promover o equilíbrio interno e a diminuir o estresse. Na terapia das cores, essa cor possui uma ação refrescante e calmante, ajudando a promover o bem-estar físico e mental. Além disso, ajuda a estimular a imunidade, sendo indicada para combater doenças infecciosas.",
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    },
                                  );
                                },
                                padding: EdgeInsets.all(10.0),
                                color: Colors.green,
                                child: Text(
                                  'Ajuda no alivio do ESTRESSE, RAIVA, MEDO e ANSIEDADE\n (Clique para ver mais!)',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          //Roxo

                          Padding(
                            padding:
                                EdgeInsets.only(top: 30, right: 5.0, left: 5.0),
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 60.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.purple[200],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(60.0))),
                                        contentPadding: EdgeInsets.only(
                                            top: 10.0,
                                            left: 15.0,
                                            right: 15.0,
                                            bottom: 15.0),
                                        title: new Text(
                                          "Roxo",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: new Text(
                                          "Remete à espiritualidade. Essa cor pode regenerar o sistema nervoso estressado e com fadiga prolongada. Reduz medos e angústias e traz estabilidade e equilíbrio da consciência. "
                                          'Devolve o ritmo da glândula pineal, purifica o organismo, acalma os músculos e a superexcitação nervosa'
                                          ", comenta a instrutora de meditação. Utilizar o roxo em ambientes de atividades espirituais e de meditação favorece o relaxamento.",
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    },
                                  );
                                },
                                padding: EdgeInsets.all(10.0),
                                color: Colors.purple,
                                child: Text(
                                  'Ajuda no alivio do ESTRESSE e RAIVA\n (Clique para ver mais!)',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          //Vermelho

                          Padding(
                            padding:
                                EdgeInsets.only(top: 30, right: 5.0, left: 5.0),
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 60.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.red[200],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(60.0))),
                                        contentPadding: EdgeInsets.only(
                                            top: 10.0,
                                            left: 15.0,
                                            right: 15.0,
                                            bottom: 15.0),
                                        title: new Text(
                                          "Vermelho",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: new Text(
                                          "Visto como a cor da paixão e da sedução, o vermelho também transmite força e coragem. "
                                          'Ele exerce um efeito tônico, estimula as células cerebrais e a combatividade. Recomenda-se usar em períodos de competições'
                                          ", destaca a especialista. Em ambientes, pode trazer energia e motivação, mas deve ser utilizada em pequenos espaços e com moderação, para não agitar demais.",
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    },
                                  );
                                },
                                padding: EdgeInsets.all(10.0),
                                color: Colors.red,
                                child: Text(
                                  'Ajuda no alivio da TRISTEZA\n (Clique para ver mais!)',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                ],
              ),
            )
          ])),
    ));
  }

  _disableA() {
    if (widget.med == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue.shade100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            title: new Text(
              "Amarelo",
              textAlign: TextAlign.center,
            ),
            content: Image(image: AssetImage('assets/Amarelo.jpg')),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (widget.ansi == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue.shade100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            title: new Text(
              "Amarelo",
              textAlign: TextAlign.center,
            ),
            content: Image(image: AssetImage('assets/Amarelo.jpg')),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (widget.raiva == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue.shade100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            title: new Text(
              "Amarelo",
              textAlign: TextAlign.center,
            ),
            content: Image(image: AssetImage('assets/Amarelo.jpg')),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (widget.triste == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue.shade100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            title: new Text(
              "Amarelo",
              textAlign: TextAlign.center,
            ),
            content: Image(image: AssetImage('assets/Amarelo.jpg')),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  _disableAZ() {
    if (widget.med == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue.shade100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            title: new Text(
              "Azul",
              textAlign: TextAlign.center,
            ),
            content: Image(
              image: AssetImage('assets/Azul.jpg'),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  _disableV() {
    if (widget.med == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue.shade100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            title: new Text(
              "Verde",
              textAlign: TextAlign.center,
            ),
            content: Image(image: AssetImage('assets/Verde.jpg')),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    ;
  }

  _disableR() {}

  _disableVa() {}
}
