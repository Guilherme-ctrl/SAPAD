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
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
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
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<GDPData, String>(
              dataSource: _chartData,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gpd,
              pointColorMapper: (GDPData data, _) => data.colorgraf,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
      ),
    ));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Medo', 35.8, Color(0xff3366cc)),
      GDPData('Raiva', 8.3, Color(0xFFF06292)),
      GDPData('Ansiedade', 10.8, Color(0xFF512DA8)),
      GDPData('Tristeza', 15.6, Color(0xffEF9A9A)),
      GDPData('Estresse', 29.5, Color(0xffff9900)),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gpd, this.colorgraf);
  final String continent;
  final double gpd;
  final Color colorgraf;
}
