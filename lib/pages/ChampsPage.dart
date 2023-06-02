import 'package:flutter/material.dart';
/*import 'package:provider/provider.dart';
import 'package:stock_management/providers/CustomersProvider.dart';
import 'package:stock_management/screen/widgets/AddButton.dart';

import 'package:stock_management/screen/widgets/SearchInput.dart';
import 'package:stock_management/service/customer-service.dart';

import '../../modal/Customer.dart';*/
import 'package:torrefacteur_k/widgets/ChampsList.dart';

import '../widgets/AddButton.dart';

class ChampsPage extends StatefulWidget {
  const ChampsPage({Key? key}) : super(key: key);

  @override
  State<ChampsPage> createState() => _ChampsPageState();
}

class _ChampsPageState extends State<ChampsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AddButton(type: 'champs'),
        appBar: AppBar(
          title: Center(child: Text('Le Torrefacteur K')),
          backgroundColor: Color(0xFF766C42),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                  ChampsList(),
              ],
          ),
        )
    );
  }
}
