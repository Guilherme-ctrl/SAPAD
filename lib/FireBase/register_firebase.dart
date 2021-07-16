import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;
late int contMedit = 0;
late int contMeditmed = 0;
late int contMeditansi = 0;
late int contMeditraiva = 0;
late int contMeditstress = 0;
late int contMedittriste = 0;
late int contCromo = 0;
late int contCromomed = 0;
late int contCromoansi = 0;
late int contCromoraiva = 0;
late int contCromostress = 0;
late int contCromotriste = 0;
late int contMusic = 0;
late int contMusicmed = 0;
late int contMusicansi = 0;
late int contMusicraiva = 0;
late int contMusicstress = 0;
late int contMusictriste = 0;
updateFirebase(String doc, String campo, var variavel) {
  db.collection(user.email.toString()).doc(doc).update({
    campo: variavel,
  });
}
