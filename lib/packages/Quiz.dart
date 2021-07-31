import 'dart:async';

import 'package:abstract_mp/packages/Celebration.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:html_character_entities/html_character_entities.dart';

class Quiz extends StatefulWidget {
  final List<dynamic> questions;
  Quiz(this.questions);
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with TickerProviderStateMixin {
  late AnimationController controller;
  int _counter = 30;
  double value = 30.00;
  Timer? _timer;

  void _startTimer() {
    _counter = 30;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          setState(() {
            selected = true;
          });
        }
      });
    });
  }

  @override
  void initState() {
    _startTimer();
    controller = AnimationController(
      value: 0,
      vsync: this,
      duration: const Duration(seconds: 30),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  int questionNo = 1, points = 0, totQues = 0;
  Color color = Colors.lightGreenAccent[700]!.withOpacity(0.9),
      color1 = Colors.redAccent[700]!.withOpacity(0.9),
      color2 = Colors.lightGreenAccent[700]!.withOpacity(0.0);
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    totQues = widget.questions.length;
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 10),
            Row(
              children: [
                Text("Question ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )),
                Text("$questionNo/$totQues ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
                child: Text(
                    HtmlCharacterEntities.decode(
                        widget.questions[questionNo - 1].question),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            Text("$_counter s",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                )),
            LinearProgressIndicator(
              value: controller.value,
              color: Colors.red,
              backgroundColor: Colors.white,
              minHeight: 10,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: selected
                  ? widget.questions[questionNo - 1].correctAnswerIndex == 0
                      ? color
                      : color1
                  : color2,
              height: 58,
              minWidth: 370,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                  borderRadius: new BorderRadius.circular(15)),
              child: Text(
                HtmlCharacterEntities.decode(
                    widget.questions[questionNo - 1].answers[0]),
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (widget.questions[questionNo - 1].isCorrect(
                        widget.questions[questionNo - 1].answers[0]) &&
                    !selected) {
                  points++;
                }
                setState(() {
                  selected = true;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: selected
                  ? widget.questions[questionNo - 1].correctAnswerIndex == 1
                      ? color
                      : color1
                  : color2,
              height: 58,
              minWidth: 370,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                  borderRadius: new BorderRadius.circular(15)),
              child: Text(
                HtmlCharacterEntities.decode(
                    widget.questions[questionNo - 1].answers[1]),
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (widget.questions[questionNo - 1].isCorrect(
                        widget.questions[questionNo - 1].answers[1]) &&
                    !selected) {
                  points++;
                }
                setState(() {
                  selected = true;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: selected
                  ? widget.questions[questionNo - 1].correctAnswerIndex == 2
                      ? color
                      : color1
                  : color2,
              height: 58,
              minWidth: 370,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                  borderRadius: new BorderRadius.circular(15)),
              child: Text(
                HtmlCharacterEntities.decode(
                    widget.questions[questionNo - 1].answers[2]),
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (widget.questions[questionNo - 1].isCorrect(
                        widget.questions[questionNo - 1].answers[2]) &&
                    !selected) {
                  points++;
                }
                setState(() {
                  selected = true;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: selected
                  ? widget.questions[questionNo - 1].correctAnswerIndex == 3
                      ? color
                      : color1
                  : color2,
              height: 58,
              minWidth: 370,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                  borderRadius: new BorderRadius.circular(15)),
              child: Text(
                HtmlCharacterEntities.decode(
                    widget.questions[questionNo - 1].answers[3]),
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (widget.questions[questionNo - 1].isCorrect(
                        widget.questions[questionNo - 1].answers[3]) &&
                    !selected) {
                  points++;
                }
                setState(() {
                  selected = true;
                });
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 60.0),
              child: MaterialButton(
                  height: 58,
                  minWidth: 250,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30)),
                  child: Text(
                    questionNo != 10 ? "Next" : "Done",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    if (questionNo <= 10) questionNo += 1;
                    if (questionNo > totQues) {
                      if (_timer!.isActive) {
                        _timer!.cancel();
                      }
                      controller.dispose();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Celebration(points)));
                    }
                    if (questionNo <= totQues) {
                      if (_timer!.isActive) {
                        _timer!.cancel();
                      }
                      setState(() {
                        controller.reset();
                        controller.forward();
                        _startTimer();
                        selected = false;
                      });
                    }
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
