import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:torrefacteur_k/modal/Joueur.dart';

import '../modal/Kafe.dart';
import '../providers/AppProvider.dart';

Future<Joueur>getJoueurs(BuildContext context) async {
  /*var kafes = await FirebaseDatabase.instance.ref().child('joueurs/').child('joueur1/exploitation/champs/0/kafes').get();

  print(jsonEncode(kafes.value));
  var decodeKafes = jsonEncode(kafes.value);

  List<Kafe> kafesFormatted = [...json.decode(decodeKafes).values.map((kafe) => Kafe.fromJson(kafe))];

  print(kafesFormatted);*/

  var response = await FirebaseDatabase.instance.ref().child('joueurs/').child('joueur1/').get();

  var decode = jsonEncode(response.value);


  /*print(json.decode(decode).kafes);*/


  /*List<Kafe> kafes = [...json.decode(decode).values.map((kafe) => Kafe.fromJson(kafe))];*/


  Joueur joueur = Joueur.fromJson(
      json.decode(decode));

  /*List<Seed> seeds = [...json.decode(decode).values.map((seed) => Seed.fromJson(seed))];*/

/*  Provider.of<AppProvider>(context,
      listen: false).currentPlayer = json.decode(decode);*/

  Provider.of<AppProvider>(context,
      listen: false)
      .setData("joueurId", joueur.id);


  return joueur;
}