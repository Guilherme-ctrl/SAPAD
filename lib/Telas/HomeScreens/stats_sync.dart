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
  late int contMedit = 1;
  late int contCromo = 1;
  late int contMusic = 1;

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
    final List<GDPData> chartData = [
      GDPData('Medo', 35, Color(0xff3366cc)),
      GDPData('Raiva', 8, Color(0xFFF06292)),
      GDPData('Ansiedade', 10, Color(0xFF512DA8)),
      GDPData('Tristeza', 17, Color(0xffEF9A9A)),
      GDPData('Estresse', 30, Color(0xffff9900)),
    ];
    return chartData;
  }
  /*for (i = 0; i < 5; i++)
        {
          if (emote == 'Medo')
            {
              emoteBase = emote,
              //será feito um cont para cada
              GDPData(emoteBase, contMedit, Color(0xff3366cc)),
            }
          else if (emote == 'Raiva')
            {
              emoteBase = emote,
              GDPData(emoteBase, contMedit, Color(0xFFF06292)),
            }
          else if (emote == 'Ansiedade')
            {
              emoteBase = emote,
              GDPData(emoteBase, contMedit, Color(0xFF512DA8)),
            }
          else if (emote == 'Tristeza')
            {
              emoteBase = emote,
              GDPData(emoteBase, contMedit, Color(0xffEF9A9A)),
            }
          else if (emote == 'Estresse')
            {
              emoteBase = emote,
              GDPData(emoteBase, contMedit, Color(0xffff9900)),
            }
      }*/

  readFirebase() async {
    var stats = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    contMedit = stats.data()?['contMedit'];

    contCromo = stats.data()?['contCromo'];

    contMusic = stats.data()?['contMusic'];
  }
}

class GDPData {
  final String emote;
  final int _contMedit;
  final Color colorgraf;
  GDPData(this.emote, this._contMedit, this.colorgraf);
}