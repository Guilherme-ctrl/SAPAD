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

  @override
  void initState() {
    //_chartData = getChartData();
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
          PieSeries<GDPData, String>(
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

  /* List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Meditação", contMedit, Color(0xff3366cc)),
      GDPData("Cromaterapia", contCromo, Color(0xFFF06292)),
      GDPData("Musicoterapia", contMusic, Color(0xFF512DA8)),
    ];
    return chartData;
  } */

  readFirebase() async {
    var contMedit = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Home')
        .get();
    contMedit = contMedit.data()?['contMedit'];
    var contCromo = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Home')
        .get();
    contCromo = contCromo.data()?['contCromo'];
    var contMusic = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Home')
        .get();
    contMusic = contMusic.data()?['contMusic'];
  }
}

class GDPData {
  final String emote;
  final int _contMedit;
  final int _contCromo;
  final int _contMusic;
  final Color colorgraf;
  GDPData(this.emote, this._contMedit, this._contCromo, this._contMusic,
      this.colorgraf);
}
