import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Question.dart';
import 'package:html_character_entities/html_character_entities.dart';

class Quiz extends StatefulWidget {
  final List<Question> questions;
  Quiz(this.questions);
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int questionNo = 1, points = 0;
  Color color = Colors.lightGreenAccent[700]!.withOpacity(0.9),
      color1 = Colors.redAccent[700]!.withOpacity(0.9),
      color2 = Colors.lightGreenAccent[700]!.withOpacity(0.0);
  bool selected = false;
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 50),
            Row(
              children: [
                Text("Question ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
                Text("$questionNo/10 ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
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
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
              ),
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
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (widget.questions[questionNo - 1]
                    .isCorrect(widget.questions[questionNo - 1].answers[0])) {
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
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (widget.questions[questionNo - 1]
                    .isCorrect(widget.questions[questionNo - 1].answers[1])) {
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
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (widget.questions[questionNo - 1]
                    .isCorrect(widget.questions[questionNo - 1].answers[2])) {
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
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (widget.questions[questionNo - 1]
                    .isCorrect(widget.questions[questionNo - 1].answers[3])) {
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
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      print(points);
                      questionNo += 1;
                      selected = false;
                    });
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
