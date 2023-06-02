import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:torrefacteur_k/API/kafeService.dart';

import '../providers/AppProvider.dart';

class AddButton extends StatefulWidget {
  final String type;

  const AddButton({Key? key, required this.type}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (widget.type == 'kafe') {
          Provider.of<AppProvider>(context, listen: false).addKafe();
        }
      },
      backgroundColor: Color(0xFF766C42),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: const Icon(Icons.add),
    );
  }
}
