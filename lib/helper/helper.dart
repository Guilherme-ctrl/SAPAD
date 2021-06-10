import 'package:flutter/material.dart';

import '../Meditation.dart';
import '../Cromo.dart';
import '../Music.dart';
import '../main.dart';

class Helper extends StatefulWidget {
  final bool med;
  final bool ansi;
  final bool raiva;
  final bool triste;
  final bool stress;

  const Helper(
      {Key key, this.med, this.ansi, this.raiva, this.triste, this.stress})
      : super(key: key);
  @override
  _HelperState createState() => _HelperState();
}

class _HelperState extends State<Helper> {
  int _indiceAtual = 0;

  //final HomePage home;

  @override
  Widget build(BuildContext context) {
    print(widget.med);
    return BottomNavigationBar(
        currentIndex: _indiceAtual,
        selectedItemColor: Colors.yellow,
        backgroundColor: Colors.blue.shade900,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white38,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Meditação',
            //backgroundColor: Color(0x00ffffff),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens),
            label: 'Cromoterapia',
            //backgroundColor: Color(0x00ffffff),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Musicoterapia',
            //backgroundColor: Color(0x00ffffff),
          )
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                          med: widget.med,
                          ansi: widget.ansi,
                          raiva: widget.raiva,
                          stress: widget.stress,
                          triste: widget.triste)));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MeditationPage(
                          med: widget.med,
                          ansi: widget.ansi,
                          raiva: widget.raiva,
                          stress: widget.stress,
                          triste: widget.triste)));
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CromoPage(
                          med: widget.med,
                          ansi: widget.ansi,
                          raiva: widget.raiva,
                          stress: widget.stress,
                          triste: widget.triste)));

              break;
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MusicPage(
                          med: widget.med,
                          ansi: widget.ansi,
                          raiva: widget.raiva,
                          stress: widget.stress,
                          triste: widget.triste)));
              break;
          }
        });
  }
}
