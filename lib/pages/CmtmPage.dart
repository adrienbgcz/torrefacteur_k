import 'package:flutter/material.dart';
/*import 'package:provider/provider.dart';
import 'package:stock_management/providers/CustomersProvider.dart';
import 'package:stock_management/screen/widgets/AddButton.dart';

import 'package:stock_management/screen/widgets/SearchInput.dart';
import 'package:stock_management/service/customer-service.dart';

import '../../modal/Customer.dart';*/
import 'package:torrefacteur_k/widgets/ChampsList.dart';

import '../widgets/AddButton.dart';

class CmtmPage extends StatefulWidget {
  const CmtmPage({Key? key}) : super(key: key);

  @override
  State<CmtmPage> createState() => _CmtmPageState();
}

class _CmtmPageState extends State<CmtmPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AddButton(type: 'champs'),
        body: SingleChildScrollView(
          child: Column(
              children: [
                  Text("In construction")
              ],
          ),
        )
    );
  }
}
