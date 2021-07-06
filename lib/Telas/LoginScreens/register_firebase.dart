import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;

registerFirebase() {
  db.collection(user.email.toString()).doc("Songs").set({
    "music": 'https://www.youtube.com/watch?v=w7o_3ME8jHs',
    "video": 'https://www.youtube.com/watch?v=IdGhUk7uJMQ',
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
    "hide": true,
    "music": true,
    "contMedit": 0,
  });
}
