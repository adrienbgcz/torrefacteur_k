import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:torrefacteur_k/modal/Joueur.dart';

import '../modal/Kafe.dart';
import '../providers/AppProvider.dart';

Future<Joueur>getJoueurs(BuildContext context) async {

  var response = await FirebaseDatabase.instance.ref().child('joueurs/').child('joueur1/').get();
  var decode = jsonEncode(response.value);

  Joueur joueur = Joueur.fromJson(
      json.decode(decode));

  Provider.of<AppProvider>(context,
      listen: false)
      .setData("joueurId", joueur.id);

  return joueur;
}