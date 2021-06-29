import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatsPage extends StatefulWidget {
  final Widget child;

  StatsPage({Key key, this.child}) : super(key: key);

  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  List<charts.Series<Colunas, String>> _seriesData;
  List<charts.Series<Emote, String>> _seriesPieData;
  List<charts.Series<Linhas, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new Colunas('Cromoterapia', 80),
      new Colunas('Meditação', 40),
      new Colunas('Musicoterapia', 10),
    ];
    var data2 = [
      new Colunas('Cromoterapia', 70),
      new Colunas('Meditação', 100),
      new Colunas('Musicoterapia', 10),
    ];
    var data3 = [
      new Colunas('Cromoterapia', 30),
      new Colunas('Meditação', 40),
      new Colunas('Musicoterapia', 60),
    ];

    var piedata = [
      new Emote('Medo', 35.8, Color(0xff3366cc)),
      new Emote('Raiva', 8.3, Color(0xFFF06292)),
      new Emote('Ansiedade', 10.8, Color(0xFF512DA8)),
      new Emote('Tristeza', 15.6, Color(0xffEF9A9A)),
      new Emote('Estresse', 29.5, Color(0xffff9900)),
    ];

    var linelinhasdata = [
      new Linhas(1, 45),
      new Linhas(2, 56),
      new Linhas(3, 55),
      new Linhas(4, 60),
      new Linhas(5, 61),
      new Linhas(6, 70),
    ];
    var linelinhasdata1 = [
      new Linhas(2, 35),
      new Linhas(21, 46),
      new Linhas(17, 45),
      new Linhas(6, 50),
      new Linhas(30, 51),
      new Linhas(4, 60),
    ];

    var linelinhasdata2 = [
      new Linhas(4, 20),
      new Linhas(1, 24),
      new Linhas(9, 25),
      new Linhas(8, 40),
      new Linhas(28, 45),
      new Linhas(2, 60),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Colunas colunas, _) => colunas.emocao,
        measureFn: (Colunas colunas, _) => colunas.quant,
        id: 'Medit',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Colunas cedit, _) =>
            charts.ColorUtil.fromDartColor(Color(0xFF1E88E5)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Colunas colunas, _) => colunas.emocao,
        measureFn: (Colunas colunas, _) => colunas.quant,
        id: 'Cromo',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Colunas cedit, _) =>
            charts.ColorUtil.fromDartColor(Color(0xFFF06292)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Colunas colunas, _) => colunas.emocao,
        measureFn: (Colunas colunas, _) => colunas.quant,
        id: 'Musicoterapia',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Colunas colunas, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Emote emote, _) => emote.emote,
        measureFn: (Emote emote, _) => emote.emotevalue,
        colorFn: (Emote emote, _) =>
            charts.ColorUtil.fromDartColor(emote.colorval),
        id: 'Meditação',
        data: piedata,
        labelAccessorFn: (Emote row, _) => '${row.emotevalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Meditação',
        data: linelinhasdata,
        domainFn: (Linhas linhas, _) => linhas.tempoval,
        measureFn: (Linhas linhas, _) => linhas.quantval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff3366cc)),
        id: 'Meditação',
        data: linelinhasdata1,
        domainFn: (Linhas linhas, _) => linhas.tempoval,
        measureFn: (Linhas linhas, _) => linhas.quantval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Meditação',
        data: linelinhasdata2,
        domainFn: (Linhas linhas, _) => linhas.tempoval,
        measureFn: (Linhas linhas, _) => linhas.quantval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Colunas, String>>();
    _seriesPieData = List<charts.Series<Emote, String>>();
    _seriesLineData = List<charts.Series<Linhas, int>>();
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
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Gráficos gerais',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            animationDuration: Duration(seconds: 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
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
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Musicoterapia',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Expanded(
                          child: charts.LineChart(_seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.ChartTitle('Tempo em minutos',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Quantidade',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea)
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
