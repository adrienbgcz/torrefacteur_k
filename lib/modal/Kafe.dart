import 'Gato.dart';

class Kafe {
  final String id;
  final String nom;
  final String avatar;
  final int tempsPousse;
  final int debutPousse;
  late final int debutSechage;
  final int productionFruits;
  final Gato gato;

  Kafe({required this.id, required this.nom, required this.avatar, required this.tempsPousse, required this.debutPousse, required this.debutSechage, required this.productionFruits, required this.gato});

  Kafe.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        nom = json['nom'],
        avatar = json['avatar'],
        tempsPousse = json['temps_pousse'],
        debutPousse = json['debut_pousse'],
        debutSechage = json['debut_sechage'],
        productionFruits = json['production_fruits'],
        gato = Gato.fromJson(json['gato']);


  Map<String, dynamic> toJson() => {
    'id': id,
    'nom': nom,
    'avatar': avatar,
    'temps_pousse' : tempsPousse,
    'debut_pousse' : debutPousse,
    'debut_sechage' : debutSechage,
    'production_fruits' : productionFruits,
    'gato': gato.toJson()
  };
  

}