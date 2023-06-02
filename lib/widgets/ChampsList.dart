import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:torrefacteur_k/pages/ChampsDetailsPage.dart';
import '../modal/Champ.dart';
import '../providers/AppProvider.dart';

class ChampsList extends StatefulWidget {
  const ChampsList({Key? key}) : super(key: key);

  Future<List<Champ>> getChampsByPlayer(BuildContext context) async {
    return await Provider.of<AppProvider>(context, listen: false)
        .getChampsByPlayer(
        Provider.of<AppProvider>(context, listen: false).joueurId);
  }

  @override
  State<ChampsList> createState() => _ChampsListState();
}

class _ChampsListState extends State<ChampsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Champ>>(
        future: widget.getChampsByPlayer(context),
        builder: (BuildContext context, AsyncSnapshot<List<Champ>> snapshot) {
          if (snapshot.hasData) {
            return Consumer<AppProvider>(
              builder: (BuildContext context, provider, Widget? child) {
                print(provider.champs);
                return ListView.builder(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  itemCount: provider.champs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Champ champ = provider.champs![index];

                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChampsDetailsPage(
                            id: champ.id,
                            champNom: champ.nom,
                            champSpecificite: champ.specificite,
                            kafes: champ.kafes,
                          ),
                        ),
                      ),
                      child: Container(
                        height: 150, // Set the desired height here
                        child: Card(
                          margin: EdgeInsets.all(15),
                          elevation: 0,
                          color: Color(0xFFD8D8C1).withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color(0xFF766C42),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Text(champ.nom),
                              subtitle: Text('Spécificité : ${champ.specificite}'),
                              leading: Icon(
                                Icons.coffee,
                                color: Colors.black,
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.transparent,
                                  width: 0.2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
