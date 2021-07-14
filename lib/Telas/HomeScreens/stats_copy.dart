import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatsPageCopy extends StatefulWidget {
  _StatsPageCopyState createState() => _StatsPageCopyState();
}

class _StatsPageCopyState extends State<StatsPageCopy> {
  late List<charts.Series<Colunas, String>> _seriesData;
  late List<charts.Series<Emote, String>> _seriesPieData;
  late List<charts.Series<Linhas, int>> _seriesLineData;
  final user = FirebaseAuth.instance.currentUser!;

  late int contMedit = 1;
  late int contCromo = 1;
  late int contMusic = 1;

  readFirebase() async {
    var stats = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    contMedit = stats.data()?['contMedit'];

    contCromo = stats.data()?['contCromo'];

    contMusic = stats.data()?['contMusic'];
  }

  _generateData() {
    var piedata = [
      new Emote('Medo', 35.8, Color(0xff3366cc)),
      new Emote('Raiva', 8.3, Color(0xFFF06292)),
      new Emote('Ansiedade', 10.8, Color(0xFF512DA8)),
      new Emote('Tristeza', 15.6, Color(0xffEF9A9A)),
      new Emote('Estresse', 29.5, Color(0xffff9900)),
    ];
  }

  @override
  void initState() {
    super.initState();
    _seriesData = <charts.Series<Colunas, String>>[];
    _seriesPieData = <charts.Series<Emote, String>>[];
    _seriesLineData = <charts.Series<Linhas, int>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    var tabBar = TabBar(
      indicatorColor: Colors.white,
      tabs: [
        Tab(
          icon: Icon(FontAwesomeIcons.solidChartBar),
        ),
        Tab(icon: Icon(FontAwesomeIcons.chartPie)),
        Tab(icon: Icon(FontAwesomeIcons.chartLine)),
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black26,
            //backgroundColor: Color(0xff308e1c),
            bottom: tabBar,
            title: Text('Estatísticas'),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cromoterapia',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child: charts.PieChart(_seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 2),
                            behaviors: [
                              new charts.DatumLegend(
                                outsideJustification:
                                    charts.OutsideJustification.endDrawArea,
                                horizontalFirst: true,
                                desiredMaxRows: 2,
                                cellPadding: new EdgeInsets.only(
                                    right: 4.0, bottom: 4.0),
                                entryTextStyle: charts.TextStyleSpec(
                                    color: charts
                                        .MaterialPalette.purple.shadeDefault,
                                    fontFamily: 'Georgia',
                                    fontSize: 13),
                              )
                            ],
                            defaultRenderer: new charts.ArcRendererConfig(
                                arcWidth: 100,
                                arcRendererDecorators: [
                                  new charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.inside)
                                ])),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Colunas {
  String emocao;
  int quant;

  Colunas(this.emocao, this.quant);
}

class Emote {
  String emote;
  double emotevalue;
  Color colorval;

  Emote(this.emote, this.emotevalue, this.colorval);
}

class Linhas {
  int tempoval;
  int quantval;

  Linhas(this.tempoval, this.quantval);
}
