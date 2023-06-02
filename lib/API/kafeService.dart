import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:torrefacteur_k/modal/Gato.dart';
import '../modal/Kafe.dart';
import 'package:uuid/uuid.dart';


Future<void> startSechage(BuildContext context, String idKafe) async {
  DatabaseReference joueursRef = FirebaseDatabase.instance.ref().child(
      'joueurs');

  String joueurKey = 'joueur1';
  String champKey = '0';
  String kafeKey = idKafe;

  joueursRef.child(joueurKey).child('exploitation').child('champs').child(
      champKey).child('kafes').child(kafeKey).update({
    'debut_sechage': DateTime
        .now()
        .millisecondsSinceEpoch,
  }).then((_) {
    print('debut_sechage updated successfully');
  }).catchError((error) {
    print('Failed to update debut_sechage: $error');
  });
}

Future<void> startPousse(BuildContext context) async {
  DatabaseReference joueursRef = FirebaseDatabase.instance.ref().child(
      'joueurs');

  String joueurKey = 'joueur1';
  String champKey = '0';
  String kafeKey = '0';

  joueursRef.child(joueurKey).child('exploitation').child('champs').child(
      champKey).child('kafes').child(kafeKey).update({
    'debut_pousse': DateTime
        .now()
        .millisecondsSinceEpoch,
  }).then((_) {
    print('debut_pousse updated successfully');
  }).catchError((error) {
    print('Failed to update debut_pousse: $error');
  });
}


void addKafe() async{
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  var uuid = Uuid();
  var uid = uuid.v1();

  // Create a new Kafe object
  Kafe newKafe = Kafe(
      id: "newKafe-$uid",
      nom: 'Roupetta',
      avatar: 'avatar',
      tempsPousse: 2400,
      debutPousse: DateTime.now().millisecondsSinceEpoch,
      debutSechage: 0,
      productionFruits: 274,
      gato: Gato(amertume: 4,gout: 87,odorat: 59,teneur: 35, id: 3));

  print(newKafe.toJson());

  // Get a reference to the "kafe" node
  DatabaseReference kafeRef = databaseReference.child('joueurs').child(
      'joueur1')
      .child('exploitation').child('champs').child('0').child('kafes').child('newKafe-$uid');


  // Set the value of the new kafe using the generated key
  kafeRef.set(newKafe.toJson()).then((_) {
    print("New kafe added successfully");
  }).catchError((error) {
    print("Failed to add new kafe: $error");
  });

}

