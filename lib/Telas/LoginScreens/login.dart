import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sapad_v3/Telas/LoginScreens/google_sign_in.dart';
import 'package:sapad_v3/control/control_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  body: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/meditFundo.jpg"),
                      fit: BoxFit.cover,
                    )),
                    child: SafeArea(
                      child: ListView(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: new BoxDecoration(
                                color: Colors.grey.withOpacity(0),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                SizedBox(height: 30),
                                Expanded(
                                  child: Text(
                                    "Sistema de Ajuda a Pacientes com Ansiedade e Depressão",
                                    style: GoogleFonts.lora(
                                        textStyle: TextStyle(
                                            color: Colors.white, fontSize: 30)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Expanded(
                                  child: Text(
                                    "S.A.P.A.D.",
                                    style: GoogleFonts.lora(
                                        textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    )),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100),
                          Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: new BoxDecoration(
                                  color: Colors.grey.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListView(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 20.0,
                                    bottom: 20.0),
                                children: [
                                  Icon(MdiIcons.accountCircle,
                                      size: 180, color: Colors.red[500]),
                                  SizedBox(height: 60),
                                  GestureDetector(
                                    child: Card(
                                        color: Colors.white,
                                        shadowColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(FontAwesomeIcons.google,
                                                  color: Colors.red),
                                              SizedBox(width: 20),
                                              Text(
                                                "Login with Google",
                                                style: GoogleFonts.lora(
                                                    textStyle: TextStyle(
                                                  fontSize: 30.0,
                                                  color: Colors.red,
                                                )),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )),
                                    onTap: () {
                                      final provider =
                                          Provider.of<GoogleSignInProvider>(
                                              context,
                                              listen: false);
                                      provider.googleLogin();
                                    },
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }));
  }
}
