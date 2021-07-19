import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#012A4A"),
      body: Text("PROFILE PAGE"),
    );
  }
}
