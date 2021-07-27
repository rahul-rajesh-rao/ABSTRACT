import 'package:flutter/material.dart';

class Celebration extends StatefulWidget {
  final int score;
  Celebration(this.score);
  @override
  _CelebrationState createState() => _CelebrationState();
}

class _CelebrationState extends State<Celebration> {
  @override
  Widget build(BuildContext context) {
    int score = widget.score;
    return Container(
      child: Center(
        child: Text("$score"),
      ),
    );
  }
}
