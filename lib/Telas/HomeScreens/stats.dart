import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: unused_import
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
  late List<GDPData> _chartData = [];
  late TooltipBehavior _tooltipBehavior;
  late int contMedit;
  late int contCromo;
  late int contMusic;
  late int i;
  late List<String> emotea = []; 
  late String emoteBase;

  @override
  void initState(){
     readFirebase();
    _tooltipBehavior = TooltipBehavior(enable: true);  
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
              xValueMapper: (GDPData data, _) => data.emoteBase,
              yValueMapper: (GDPData data, _) => data._contMedit,
              pointColorMapper: (GDPData data, _) => data.colorgraf,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
      ),
    ));
  }

  List<GDPData> getChartData(){
    print(emotea);
    print('CEBOLACEBOLACEBOLACEBOLACEBOLACEBOLACEBOLACEBOLACEBOLACEBOLACEBOLA');
    final List<GDPData> chartData = [];  
    //for (String emoteBase in emotea){
    this.emotea.forEach((emoteBase) => {
      if (emoteBase == 'Medo') {
        print("123"),
        chartData.add (new GDPData(emoteBase, contMedit, Colors.blue)),
        print(chartData),
      } else if (emoteBase == 'Raiva') {
        chartData.add(new GDPData(emoteBase, contMedit, Color(0xFFF06292))),       
      } else if (emoteBase == 'Ansiedade') {
        chartData.add(new GDPData(emoteBase, contMedit, Color(0xFF512DA8))),
      } else if (emoteBase == 'Tristeza') {
        chartData.add(new GDPData(emoteBase, contMedit, Color(0xffEF9A9A))),
      } else if (emoteBase == 'Estresse') {
        chartData.add(new GDPData(emoteBase, contMedit, Color(0xffff9900))),
      }
    });  
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
    List<String> emotea = [];
    if ((emote.data()?['med'])==true) {
      emotea.add('Medo');
    } if ((emote.data()?['ansi'])==true) {
      emotea.add('Ansiedade');
    } if ((emote.data()?['raiva'])==true) {
      emotea.add('Raiva');
    } if ((emote.data()?['stress'])==true) {
      emotea.add('Estresse');
    } if ((emote.data()?['triste'])==true) {
      emotea.add('Triste');
    }
    print(emotea);
    this.emotea = emotea;
    this._chartData = getChartData();
  }
  /*emote123(emote);
    Future<void> emote123(DocumentSnapshot<Map<String, dynamic>> emote) async {
      String _emote = emote.data()?[];
    }*/
}


class GDPData {
  String emoteBase;
  final int _contMedit;
  final Color colorgraf;
  GDPData(this.emoteBase, this._contMedit, this.colorgraf);
}
