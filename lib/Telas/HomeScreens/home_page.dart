import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sapad_v3/Telas/LoginScreens/login.dart';
import 'package:sapad_v3/control/control_page.dart';

class HomePageNew extends StatelessWidget {
  const HomePageNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Something Went Wrong'));
            } else if (snapshot.hasData) {
              return ControlPage();
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
