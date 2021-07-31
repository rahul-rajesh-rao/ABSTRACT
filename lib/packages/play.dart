import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Quiz.dart';

class Play extends StatefulWidget {
  final List<dynamic> questions;
  String difficulty, madeby, topic;
  Play(this.questions, this.topic, this.difficulty, this.madeby);
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    String diff = widget.difficulty, top = widget.topic, mdby = widget.madeby;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#012A4A"),
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SvgPicture.asset(
              "assets/Abstract_logo.svg",
              height: 22.0,
              width: 30,
            ),
          ),
        ),
        backgroundColor: HexColor("#012A4A"),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("$top",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(
                height: 50,
              ),
              Text("Made By: $mdby",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 8,
              ),
              Text("Difficulty level: $diff",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Center(
                  child: SvgPicture.asset(
                    'assets/play.svg',
                    height: 450,
                    width: 1000,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Quiz(widget.questions)));
                  },
                  height: 58,
                  minWidth: 170,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  child: Text(
                    "Play",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
            ]),
          ),
        ));
  }
}
