import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sapad_v3/Telas/HomeScreens/acomp.dart';
import 'package:sapad_v3/Telas/HomeScreens/home.dart';
import 'package:sapad_v3/Telas/HomeScreens/info.dart';
import 'package:sapad_v3/Telas/HomeScreens/stats.dart';
import 'package:sapad_v3/Telas/HomeScreens/stats_copy.dart';
import 'package:sapad_v3/Telas/HomeScreens/stats_sync.dart';
import 'package:sapad_v3/Telas/Screens/cromo.dart';

class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final List _telas = [InfoPage(), HomePage(), StatsPageCopy(), AcompPage()];
  FirebaseFirestore db = FirebaseFirestore.instance;

  int _indiceAtual = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        currentIndex: _indiceAtual,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info, size: 20.0),
            activeIcon: Icon(Icons.info, size: 30.0),
            label: 'Info',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max, size: 20.0),
              activeIcon: Icon(Icons.home_filled, size: 30.0),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, size: 20.0),
            activeIcon: Icon(MdiIcons.chartBellCurveCumulative, size: 30.0),
            label: 'Estatísticas',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye, size: 20.0),
              activeIcon: Icon(MdiIcons.handHeart, size: 30.0),
              label: 'Acompanhamento')
        ],
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
