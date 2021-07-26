import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, correctAnswer, optionSelected;

  OptionTile(
      {required this.correctAnswer,
      required this.option,
      required this.optionSelected});

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 58,
      minWidth: 370,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 2),
          borderRadius: new BorderRadius.circular(15)),
      child: Text(
        "${widget.option}",
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      onPressed: () {},
    );
  }
}
