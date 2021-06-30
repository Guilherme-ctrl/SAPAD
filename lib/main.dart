import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sapad_v3/Telas/HomeScreens/stats.dart';
import 'package:sapad_v3/Telas/HomeScreens/home.dart';
import 'package:sapad_v3/Telas/HomeScreens/info.dart';
import 'package:sapad_v3/Telas/Screens/config.dart';
import 'package:sapad_v3/games/game_azul.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    //Firestore.instance
    //.collection("col")
    //.document("doc")
    //.setData({"texto": "daniel"}),
    home: ControlPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ControlPage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  final List<Widget> _telas = [InfoPage(), HomePage(), StatsPage()];
  int _indiceAtual = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        currentIndex: _indiceAtual,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info, size: 20.0),
            activeIcon: Icon(Icons.info, size: 30.0),
            title: Text("Info"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max, size: 20.0),
            activeIcon: Icon(Icons.home_filled, size: 30.0),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, size: 20.0),
            activeIcon: Icon(MdiIcons.chartBellCurveCumulative, size: 30.0),
            title: Text("Estatísticas "),
          )
        ],
        onTap: onTabTapped,
      ),
    );
  }

//
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
