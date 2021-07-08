import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatsPage extends StatefulWidget {
  final Widget? child;

  StatsPage({Key? key, this.child}) : super(key: key);

  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late int contMedit;
  late int contCromo;
  late int contMusic;
  late int i;
  late String emotea = '';
  late String emoteBase;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    readFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black87,
      body: SfCircularChart(
        title: ChartTitle(
          text: 'Estatísticas Gerais \n Conforme uso por emoção sentida',
          textStyle: TextStyle(color: Colors.white),
        ),
        legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            textStyle: TextStyle(color: Colors.white),
            alignment: ChartAlignment.center,
            itemPadding: 20),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
              dataSource: _chartData,
              xValueMapper: (GDPData data, _) => data.emote,
              yValueMapper: (GDPData data, _) => data._contMedit,
              pointColorMapper: (GDPData data, _) => data.colorgraf,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
      ),
    ));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [];
    for (i = 0; i < emotea.length; i++) {
      if (emotea == 'Medo') {
        print("123");
        emoteBase = emotea;
        //será feito um cont para cada
        chartData.add(GDPData(emoteBase, contMedit, Colors.blue));
      } else if (emotea == 'Raiva') {
        emoteBase = emotea;
        GDPData(emoteBase, contMedit, Color(0xFFF06292));
      } else if (emotea == 'Ansiedade') {
        emoteBase = emotea;
        GDPData(emoteBase, contMedit, Color(0xFF512DA8));
      } else if (emotea == 'Tristeza') {
        emoteBase = emotea;
        GDPData(emoteBase, contMedit, Color(0xffEF9A9A));
      } else if (emotea == 'Estresse') {
        emoteBase = emotea;
        GDPData(emoteBase, contMedit, Color(0xffff9900));
      }
    }

    return chartData;
  }

  readFirebase() async {
    var contMedit1 = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();

    print(contMedit1.data());
    contMedit = await contMedit1.data()?['contMedit'];
    var contCromo1 = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    contCromo = await contCromo1.data()?['contCromo'];
    var contMusic1 = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    contMusic = await contMusic1.data()?['contMusic'];
    var emote = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Emotion')
        .get();
    print(emote.data());
    emotea = emote.data()?[''];
    List<String> listEmote = [];
    if (emote.data()?['med']) {
      listEmote.add('Medo');
    } else if (emote.data()?['ansi']) {
      listEmote.add('Ansiedade');
    } else if (emote.data()?['raiva']) {
      listEmote.add('Raiva');
    } else if (emote.data()?['stress']) {
      listEmote.add('Estresse');
    } else if (emote.data()?['triste']) {
      listEmote.add('Triste');
    }
  }
}

class GDPData {
  final String emote;
  final int _contMedit;
  final Color colorgraf;
  GDPData(this.emote, this._contMedit, this.colorgraf);
}
