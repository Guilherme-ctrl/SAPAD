import 'package:firebase_auth/firebase_auth.dart';
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
  late int contMedit = 0;
  late int contMeditmed = 0;
  late int contMeditansi = 0;
  late int contMeditraiva = 0;
  late int contMeditstress = 0;
  late int contMedittriste = 0;
  late int contCromo = 0;
  late int contCromomed = 0;
  late int contCromoansi = 0;
  late int contCromoraiva = 0;
  late int contCromostress = 0;
  late int contCromotriste = 0;
  late int contMusic = 0;
  late int contMusicmed = 0;
  late int contMusicansi = 0;
  late int contMusicraiva = 0;
  late int contMusicstress = 0;
  late int contMusictriste = 0;
  late List<String> emotea = [];
  late String emoteBase;

  @override
  void initState() {
    readFirebase();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhh $_chartData');
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black87,
      body: SfCircularChart(
        title: ChartTitle(
          text:
              'Estatísticas da Meditação \n Conforme uso por emoção sentida \n\n\n Total de Meditações realizadas $contMedit',
          textStyle: TextStyle(color: Colors.white),
        ),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          textStyle: TextStyle(color: Colors.white),
          alignment: ChartAlignment.center,
          itemPadding: 20,
        ),
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
  }

  List<GDPData> getChartData() {
    print('TESTETESTETESTETESTETESTETESTETESTETESTETESTE');
    final List<GDPData> chartData = [];
    this.emotea.forEach((emoteBase) => {
          print(emoteBase),
          if (emoteBase == 'Medo')
            {
              contMedit = contMeditmed,
              chartData.add(new GDPData('Medo', contMedit, Color(0xff3366cc))),
            }
          else if (emoteBase == 'Raiva')
            {
              contMedit = contMeditraiva,
              print(contMedit),
              chartData.add(new GDPData('Raiva', contMedit, Color(0xFFF06292))),
            }
          else if (emoteBase == 'Ansiedade')
            {
              contMedit = contMeditansi,
              chartData
                  .add(new GDPData('Ansiedade', contMedit, Color(0xFF512DA8))),
            }
          else if (emoteBase == 'Triste')
            {
              contMedit = contMedittriste,
              chartData
                  .add(new GDPData('Triste', contMedit, Color(0xffEF9A9A))),
            }
          else if (emoteBase == 'Estresse')
            {
              contMedit = contMeditstress,
              chartData
                  .add(new GDPData('Estresse', contMedit, Color(0xffff9900))),
            }
        });
    return chartData;
  }

  readFirebase() async {
    var tec = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Stats')
        .get();
    contCromo = tec.data()?['contCromo'];
    contMedit = tec.data()?['contMedit'];
    contMusic = tec.data()?['contMusic'];
    contMeditansi = tec.data()?['contMeditansi'];
    contMeditmed = tec.data()?['contMeditmed'];
    contMeditraiva = tec.data()?['contMeditraiva'];
    contMeditstress = tec.data()?['contMeditstress'];
    contMedittriste = tec.data()?['contMedittriste'];
    contCromoansi = tec.data()?['contCromoansi'];
    contCromomed = tec.data()?['contCromomed'];
    contCromoraiva = tec.data()?['contCromoraiva'];
    contCromostress = tec.data()?['contCromostress'];
    contCromotriste = tec.data()?['contCromotriste'];
    contMusicansi = tec.data()?['contMusicansi'];
    contMusicmed = tec.data()?['contMusicmed'];
    contMusicraiva = tec.data()?['contMusicraiva'];
    contMusicstress = tec.data()?['contMusicstress'];
    contMusictriste = tec.data()?['contMusictriste'];
    var emote = await FirebaseFirestore.instance
        .collection(user.email.toString())
        .doc('Emotion')
        .get();
    print(emote.data());
    List<String> emotea = [];

    emotea.add('Medo');

    emotea.add('Ansiedade');

    emotea.add('Raiva');

    emotea.add('Estresse');

    emotea.add('Triste');

    this.emotea = emotea;
    print(' flgmdflkgmdopmkpdfg $emotea');
    _chartData = getChartData();
    setState(() {});
    print("testetestetestetestetestetestetestetestetesteteste, $_chartData");
  }
}

class GDPData {
  final String emoteBase;
  final int contMedit;
  final Color colorgraf;
  GDPData(this.emoteBase, this.contMedit, this.colorgraf);

  @override
  String toString() {
    return emoteBase + contMedit.toString();
  }
}
