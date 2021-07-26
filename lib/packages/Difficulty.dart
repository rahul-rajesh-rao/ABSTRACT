import 'package:abstract_mp/packages/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Api.dart';

class Difficulty extends StatefulWidget {
  final String topic, tpid;
  Difficulty(this.topic, this.tpid);
  @override
  _DifficultyState createState() => _DifficultyState();
}

class _DifficultyState extends State<Difficulty> {
  late final questions;
  List<bool> selected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#012A4A"),
        appBar: AppBar(
          backgroundColor: HexColor("#012A4A"),
        ),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.topic,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      SizedBox(
                        height: 150,
                      ),
                      Text("Select Difficulty:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w300,
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                        child: MaterialButton(
                          height: 58,
                          minWidth: 370,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30)),
                          child: Text(
                            "Easy",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          color: selected[0] ? Colors.blue[700] : Colors.white,
                          onPressed: () {
                            print("lol");
                            questions = Api(widget.tpid, "easy");
                            questions.getJson();
                            setState(() {
                              selected = [true, false, false];
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                        child: MaterialButton(
                          height: 58,
                          minWidth: 370,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30)),
                          child: Text(
                            "Medium",
                            style: TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          color: selected[1] ? Colors.blue[700] : Colors.white,
                          onPressed: () {
                            print("lol");
                            questions = Api(widget.tpid, "medium");
                            questions.getJson();
                            setState(() {
                              selected = [false, true, false];
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                        child: MaterialButton(
                          height: 58,
                          minWidth: 370,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30)),
                          child: Text(
                            "Genius",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          color: selected[2] ? Colors.blue[700] : Colors.white,
                          onPressed: () {
                            print("lol");
                            questions = Api(widget.tpid, "hard");
                            questions.getJson();
                            setState(() {
                              selected = [false, false, true];
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: MaterialButton(
                          height: 58,
                          minWidth: 250,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30)),
                          child: Text(
                            "Start",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Quiz(questions.value)));
                          },
                        ),
                      )
                    ]))));
  }
}
