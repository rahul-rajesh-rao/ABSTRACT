import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#012A4A"),
      body: Text("CREATE PAGE"),
    );
  }
}
