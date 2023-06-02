import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:torrefacteur_k/providers/AppProvider.dart';
import '../modal/Kafe.dart';
import '../widgets/AddButton.dart';
import 'package:flutter/services.dart';

class ChampsDetailsPage extends StatefulWidget {
  Future<List<Kafe>> getKafes(BuildContext context) async {
    return await Provider.of<AppProvider>(context, listen: false).getKafes();
  }

  const ChampsDetailsPage({
    Key? key,
    required this.id,
    required this.champNom,
    required this.champSpecificite,
    required this.kafes,
  }) : super(key: key);

  final int id;
  final String champNom, champSpecificite;
  final List<Kafe> kafes;

  @override
  State<ChampsDetailsPage> createState() => _ChampsDetailsPageState();
}

class _ChampsDetailsPageState extends State<ChampsDetailsPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Kafe>>(
      future: widget.getKafes(context),
      builder: (BuildContext context, AsyncSnapshot<List<Kafe>> snapshot) {
        if (snapshot.hasData) {
          return Consumer<AppProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              return Scaffold(
                floatingActionButton: AddButton(type: 'kafe'),
                appBar: AppBar(
                  title: Center(child: Text('Le Torrefacteur K')),
                  backgroundColor: Color(0xFF766C42),
                ),
                body: RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: () async {
                    await widget.getKafes(context);
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 5),
                          child: Card(
                            color: Color(0xFF766C42),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xFF766C42), width: 0.4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  widget.champNom,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0), // Adjust the margin value as needed
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              _refreshIndicatorKey.currentState?.show();
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text('Refresh'),
                            backgroundColor: Color(0xFF1D433E),
                          ),
                        ),
                        ListView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            Kafe kafe = snapshot.data![index];

                            var tempsPousse = kafe.tempsPousse;
                            var tempsEcouleDebutPousse =
                                (DateTime.now().millisecondsSinceEpoch -
                                    kafe.debutPousse) /
                                    1000;
                            var pourcentagePousse =
                            (tempsEcouleDebutPousse * 100 / tempsPousse)
                                .round();

                            var tempsSechage = kafe.productionFruits / 100 * 600;
                            var tempsDebutSechage = kafe.debutSechage;
                            var tempsEcouleDebutSechage =
                                (DateTime.now().millisecondsSinceEpoch -
                                    tempsDebutSechage) /
                                    1000;
                            var pourcentageSechage =
                            (tempsEcouleDebutSechage * 100 / tempsSechage)
                                .round();

                            return Container(
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
                                    title: Text(kafe.nom),
                                    subtitle: kafe.debutSechage > 0
                                        ? Text(
                                        'Séchage : ${pourcentageSechage < 100 ? pourcentageSechage : '100'} %')
                                        : Text(
                                        'Pousse : ${pourcentagePousse < 100 ? pourcentagePousse : '100'} %'),
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
                                    trailing: pourcentagePousse >= 100 &&
                                        kafe.debutSechage == 0
                                        ? ElevatedButton.icon(
                                        icon: Icon(Icons.double_arrow),
                                        label: Text("Sécher"),
                                        onPressed: () async => {
                                          if (pourcentagePousse >= 100)
                                            {
                                              Provider.of<AppProvider>(context,
                                                  listen: false).startSechage(
                                                  context,
                                                  snapshot.data![index])
                                            },

                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFF766C42)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      4))),
                                        ))
                                        : Text(""),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
