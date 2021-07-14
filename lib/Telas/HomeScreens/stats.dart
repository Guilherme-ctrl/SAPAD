import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: unused_import
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatsPage extends StatefulWidget {
  /* final Widget child;

  StatsPage({required Key key, required this.child}) : super(key: key); */

  _StatsPageState createState() => _StatsPageState();
}

//
class _StatsPageState extends State<StatsPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  List<GDPData> _chartData = [];
  late TooltipBehavior _tooltipBehavior;
  late int contMedit;
  late int contCromo;
  late int contMusic;
  late List<String> emotea = [];
  late String emoteBase;

  @override
  void initState() {
    readFirebase();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
        backgroundColor: Colors.black87,
        body: SfCircularChart(
          title: ChartTitle(
            text:
                'Estatísticas da Meditação \n Conforme uso por emoção sentida',
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
            DoughnutSeries<GDPData, dynamic>(
                dataSource: _chartData,
                xValueMapper: (GDPData data, _) => data.emoteBase,
                yValueMapper: (GDPData data, _) => data.contMedit,
                pointColorMapper: (GDPData data, _) => data.colorgraf,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true),
          ],
        ),
      ));

  List<GDPData> getChartData() {
    print('TESTETESTETESTETESTETESTETESTETESTETESTETESTE');
    final List<GDPData> chartData = [];
    this.emotea.forEach((emoteBase) => {
          print(emoteBase),
          if (emoteBase == 'Medo')
            {
              chartData.add(GDPData('Medo', contMedit, Colors.cyan)),
              print(chartData),
              print(contMedit),
            }
          else if (emoteBase == 'Raiva')
            {
              chartData
                  .add(GDPData('Raiva', contMedit, Colors.lightGreenAccent)),
              print(chartData),
              print(contMedit),
            }
          else if (emoteBase == 'Ansiedade')
            {
              chartData.add(GDPData('Ansiedade', contMedit, Colors.white60)),
              print(chartData),
              print(contMedit),
            }
          else if (emoteBase == 'Triste')
            {
              chartData.add(GDPData('Triste', contMedit, Colors.orangeAccent)),
              print(chartData),
              print(contMedit),
            }
          else if (emoteBase == 'Estresse')
            {
              chartData.add(GDPData('Estresse', contMedit, Colors.deepPurple)),
              print(chartData),
              print(contMedit),
            }
        });
    return chartData;
  }

  readFirebase() async {
    var contMedit1 = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    contMedit = await contMedit1.data()?['contMedit'];
    print(contMedit);
    var contCromo1 = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    contCromo = await contCromo1.data()?['contCromo'];
    print(contCromo);
    var contMusic1 = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    contMusic = await contMusic1.data()?['contMusic'];
    print(contMusic);
    var emote = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Emotion')
        .get();
    print(emote.data());
    List<String> emotea = [];
    if ((emote.data()?['med']) == true) {
      emotea.add('Medo');
    }
    if ((emote.data()?['ansi']) == true) {
      emotea.add('Ansiedade');
    }
    if ((emote.data()?['raiva']) == true) {
      emotea.add('Raiva');
    }
    if ((emote.data()?['stress']) == true) {
      emotea.add('Estresse');
    }
    if ((emote.data()?['triste']) == true) {
      emotea.add('Triste');
    }
    print(emotea);
    this.emotea = emotea;
    _chartData = getChartData();
    print("testetestetestetestetestetestetestetestetesteteste, $_chartData");
  }
}

class GDPData {
  final String emoteBase;
  final int contMedit;
  final Color colorgraf;
  GDPData(this.emoteBase, this.contMedit, this.colorgraf);
}
