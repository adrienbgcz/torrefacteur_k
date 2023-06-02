import 'Kafe.dart';

class Champ {
  int id;
  final String nom;
  final String specificite;
  final List<Kafe> kafes;

  Champ (
      {
      required this.id,
      required this.nom,
      required this.specificite,
      required this.kafes});

  Champ.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nom = json['nom'],
        specificite = json['specificite'],
        kafes = [...json['kafes'].values.map((kafe) => Kafe.fromJson(kafe))];

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'specificite': specificite,
        'kafes': kafes.map((kafe) => kafe.toJson()).toList()
      };
}
