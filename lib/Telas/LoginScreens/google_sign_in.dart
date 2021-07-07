import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  FirebaseFirestore db = FirebaseFirestore.instance;

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      db.collection(user.email.toString()).doc("Songs").set({
        "music": 'https://www.youtube.com/watch?v=w7o_3ME8jHs',
        "video": 'https://www.youtube.com/watch?v=IdGhUk7uJMQ',
        "emailAcomp": '',
      });

      db.collection(user.email.toString()).doc("Emotion").set({
        "anti": false,
        "med": false,
        "raiva": false,
        "stress": false,
        "triste": false
      });

      db.collection(user.email.toString()).doc("Home").set({
        "cromo": true,
        "medit": true,
        "music": true,
      });

      db.collection(user.email.toString()).doc("Stats").set({
        "contMedit": 1,
        "contCromo": 1,
        "contMusic": 1,
      });

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
