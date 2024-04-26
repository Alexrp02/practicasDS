import 'package:flutter/material.dart';
import 'package:p2/modelo/globals.dart' as globals;

class ListaCasas extends StatefulWidget {
  const ListaCasas({super.key});

  @override
  _ListaCasasState createState() => _ListaCasasState();
}

class _ListaCasasState extends State<ListaCasas> {
  @override
  void initState() {
    print(globals.casasCreadas.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
