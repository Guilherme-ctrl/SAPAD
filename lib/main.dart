import 'package:flutter/material.dart';
import 'package:sapad_v3/Telas/HomeScreens/chat.dart';
import 'package:sapad_v3/Telas/HomeScreens/home.dart';
import 'package:sapad_v3/Telas/HomeScreens/info.dart';
import 'package:sapad_v3/Telas/Screens/config.dart';

void main() {
  runApp(MaterialApp(
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
  final List<Widget> _telas = [InfoPage(), HomePage(), ChatPage()];
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
            icon: Icon(Icons.chat, size: 20.0),
            activeIcon: Icon(Icons.chat_bubble, size: 30.0),
            title: Text("Chat"),
          )
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
