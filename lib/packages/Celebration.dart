import 'package:abstract_mp/packages/NavScreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
    return Scaffold(
      backgroundColor: HexColor("#012A4A"),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Quiz Completed!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "You got $score points.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 115,
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => NavScreen()));
                    },
                    height: 58,
                    minWidth: 170,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
