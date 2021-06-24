import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//var medit, cromo, music
class StatsPage extends StatefulWidget {
  const StatsPage({Key key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}
//botão de menu
class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      
      body: ListView(
        padding: EdgeInsets.only(top: 35.0, left: 10.0, right: 20.0),
          children: [
            Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 24,
              ),
              onPressed: (){},
            ),
          ),

          //CARD 1
            Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: SizedBox(
              height: 200.0,
              width: 100.0,
              child: Card(
                color: Colors.black54,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Futuro Grafico",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        )),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Icon(MdiIcons.chartDonut, size: 70.0),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Card 2
          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 10.0),
            child: SizedBox(
              height: 200.0,
              width: 100.0,
              child: Card(
                color: Colors.black54,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Futuro Grafico",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        )),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Icon(MdiIcons.chartDonut, size: 70.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}
