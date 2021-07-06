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

  //Vai ter que criar um cont pra cada emoção ent
//mas acho que vai ter que fazer um cont pra cada uma msm pra outro tipo de grafico sim
//grafico de barra?
  //Aqui é onde eu coloco manualmente no caso
  //so coloca as variavies aki ent
  //ele da erro dai
  // cara o gráfico é só sobre meditação
  // as infos são sobre meditação e qual o sentimento usado para medita
  //ou arrumar outra forma de fazer o gráfico eu n sei oq seria melhor no caso
  //
  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Meditação", contMedit, Color(0xff3366cc)),
      GDPData("Cromaterapia", contCromo, Color(0xFFF06292)),
      GDPData("Musicoterapia", contMusic, Color(0xFF512DA8)),
    ];
    return chartData;
  }
/*

  Fala segu meu cursor

*/

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

/*
aqui é a classe do gráfico aqui é onde puxa tudo das variáveis e talz
blz o contMedit vai dar o tanto de medit ok porém eu tenho que colocar variavel
por variavel tipo medo ansi raiva dentro da classe certo?
 
sim pq o seguinte eu preciso delas ali no GDP data tendeu pra passar lá em cima e eetc
 ta declarando outras variavies?
*/

class GDPData {
  final String emote;
  final int _contMedit;
  final int _contCromo;
  final int _contMusic;
  final Color colorgraf;
  GDPData(this.emote, this._contMedit, this._contCromo, this._contMusic,
      this.colorgraf);
}
