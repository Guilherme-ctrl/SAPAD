import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/Telas/LoginScreens/google_sign_in.dart';
import 'package:sapad_v3/control/control_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email, _password;
  final auth = FirebaseAuth.instance;

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
                return Scaffold(
                  backgroundColor: Colors.black87,
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/Logo.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: new BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(80)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Container(
                                    child: Text(
                                      'Sistema de Ajuda a Pacientes com Ansiedade e Depressão',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.merriweather(
                                          textStyle: TextStyle(
                                              fontSize: 25.0,
                                              color: Colors.white)),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .2,
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: GestureDetector(
                                    child: Card(
                                      shadowColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(FontAwesomeIcons.google),
                                          Text('Sign Up with Google')
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      final provider =
                                          Provider.of<GoogleSignInProvider>(
                                              context,
                                              listen: false);
                                      provider.googleLogin();
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
