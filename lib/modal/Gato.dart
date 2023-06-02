class Gato{
  final int id;
  final int gout;
  final int amertume;
  final int teneur;
  final int odorat;



  Gato({required this.id, required this.gout, required this.amertume, required this.teneur, required this.odorat});

  Gato.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        gout = json['gout'],
        amertume = json['amertume'],
        teneur = json['teneur'],
        odorat = json['odorat'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'gout': gout,
    'amertume': amertume,
    'teneur': teneur,
    'odorat': odorat
  };
}