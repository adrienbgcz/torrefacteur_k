import 'Exploitation.dart';

class Joueur{
    final int id;
    final String? nom;
    final String? prenom;
    final String? pseudo;
    final String? avatar;
    final String? email;
    final int? dv;
    final Exploitation exploitation;

    Joueur({required this.id,required this.nom, required this.prenom, required this.pseudo, required this.avatar, required this.email, required this.dv, required this.exploitation});

    Joueur.fromJson(Map<String, dynamic> json)
        :
        id =  json['id'],
        nom = json['nom'],
        prenom = json['prenom'],
        pseudo = json['pseudo'],
        avatar = json['avatar'],
        email = json['email'],
        dv = json['dv'],
        exploitation = Exploitation.fromJson(json['exploitation']);

    Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'prenom': prenom,
        'pseudo': pseudo,
        'avatar': avatar,
        'email': email,
        'dv': dv,
        'exploitation': exploitation.toJson()
    };
    
}