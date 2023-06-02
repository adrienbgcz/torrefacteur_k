import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:torrefacteur_k/modal/Kafe.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import '../modal/Champ.dart';
import '../modal/Gato.dart';


class AppProvider extends ChangeNotifier {
  List<Kafe> _kafes = [];
  int joueurId = 0;


  void setData(dataType, value) {
    switch (dataType) {
      case "joueurId":
        {
          joueurId = value;
        }
        break;
    }
  }


  List<Champ> _champs = [];

  UnmodifiableListView<Champ> get champs =>
      UnmodifiableListView(_champs);

  Future<List<Champ>> getChampsByPlayer(id) async {

    try {
      var response = await FirebaseDatabase.instance
          .ref()
          .child('joueurs/')
          .child('joueur1/')
          .child('exploitation/')
          .child('champs/')
          .get();

      var decode = jsonEncode(response.value);
      print(json.decode(decode));

      _champs = List<Champ>.from(
          json.decode(decode).map((champ) => Champ.fromJson(champ)));

      print(_champs[0].nom);
      notifyListeners();
      return _champs;
    } catch (e) {
      print(e);
      return [];
    }
  }


  UnmodifiableListView<Kafe> get customers =>
      UnmodifiableListView(_kafes);

  Future<List<Kafe>> getKafes() async {
    try {
      var response = await FirebaseDatabase.instance
          .ref()
          .child('joueurs/')
          .child('joueur1/')
          .child('exploitation/')
          .child('champs/')
          .child('0/')
          .child('kafes/')
          .get();

      var decode = jsonEncode(response.value);
      print(json.decode(decode));


      _kafes = List<Kafe>.from(
          json.decode(decode).values.map((kafe) => Kafe.fromJson(kafe)));

      print(_kafes);

      notifyListeners();
      return _kafes;
    } catch (e) {
      print(e);
      return [];
    }
  }
  Future<void> addKafe() async{
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

    _kafes.add(newKafe);
    notifyListeners();

  }


  Future<void> startSechage(BuildContext context, Kafe kafe) async {
    DatabaseReference joueursRef = FirebaseDatabase.instance.ref().child(
        'joueurs');

    String joueurKey = 'joueur1';
    String champKey = '0';
    /*String kafeKey = idKafe;*/
    String kafeKey = kafe.id.toString();

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

    int index = _kafes.indexWhere((element) => element.id == kafe.id);


    if (index != -1) {
      // Create a new Kafe object with updated debutSechage value
      Kafe updatedKafe = Kafe(
        id: kafe.id,
        nom: kafe.nom,
        avatar: kafe.avatar,
        tempsPousse: kafe.tempsPousse,
        debutPousse: kafe.debutPousse,
        debutSechage: DateTime.now().millisecondsSinceEpoch,
        productionFruits: kafe.productionFruits,
        gato: kafe.gato,
      );

      _kafes[index] = updatedKafe;
    } else {
      // Handle the case where the newKafe object is not found in the _kafes list
      print("newKafe object not found in the list");
    }
    notifyListeners();
  }






}

