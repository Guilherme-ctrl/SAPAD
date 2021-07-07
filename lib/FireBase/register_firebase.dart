import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;

updateFirebase(String doc, String campo, var variavel) {
  db.collection(user.email.toString()).doc(doc).update({
    campo: variavel,
  });
}

readFirebase(var variavel, String doc, String campo) async {
  var variavelPadrao = await FirebaseFirestore.instance
      .collection(user.email.toString())
      .doc(doc)
      .get();
  variavel = variavelPadrao.data()?[campo];
  return variavel;
}
