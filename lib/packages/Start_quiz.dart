import 'package:abstract_mp/models/question_model.dart';
import 'package:abstract_mp/packages/option_tile.dart';
import 'package:abstract_mp/service/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class startQuiz extends StatefulWidget {
  final String quizId;

  startQuiz(this.quizId);

  @override
  _startQuizState createState() => _startQuizState();
}

class _startQuizState extends State<startQuiz> {
  late final questionModel;
  String optionSelected = "";
  late final QuerySnapshot questionSnaphot;
  DatabaseService databaseService = new DatabaseService();
  bool isLoading = true;

  @override
  void initState() {
    databaseService.getQuestionData(widget.quizId).then((value) {
      questionSnaphot = value;
      print("questions incoming");
      setState(() {});
    });
    print("${widget.quizId}");

    super.initState();
  }

  // void getQuestionModelFromDatasnapshot(
  //     QuerySnapshot questionSnapshot) async {
  //   QuestionModel questionModel = new QuestionModel();

  //   questionModel.question = questionSnapshot.docs;

  //   /// shuffling the options
  //   List<String> options = [
  //     await questionSnapshot.get("option1"),
  //     await questionSnapshot.get("option2"),
  //     await questionSnapshot.get("option3"),
  //     await questionSnapshot.get("option4")
  //   ];
  //   options.shuffle();

  //   questionModel.option1 = options[0];
  //   questionModel.option2 = options[1];
  //   questionModel.option3 = options[2];
  //   questionModel.option4 = options[3];
  //   questionModel.correctOption = questionSnapshot.get("option1");
  //   questionModel.answered = false;
  // }

  @override
  Widget build(BuildContext context) {
    final List n = questionSnaphot.docs;
    print(n[1]["question"]);
    // getQuestionModelFromDatasnapshot(questionSnaphot);
    return Scaffold(
      backgroundColor: HexColor("#012A4A"),
      appBar: AppBar(
        backgroundColor: HexColor("#012A4A"),
      ),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 90),
                      Row(
                        children: [
                          Text("Question ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              )),
                          Text("1/10 ",
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
                          child: Text(questionModel.question,
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
                      OptionTile(
                          correctAnswer: questionModel.option1,
                          option: questionModel.option1,
                          optionSelected: optionSelected)
                      // MaterialButton(
                      //   height: 58,
                      //   minWidth: 370,
                      //   shape: RoundedRectangleBorder(
                      //       side: BorderSide(color: Colors.white, width: 2),
                      //       borderRadius: new BorderRadius.circular(15)),
                      //   child: Text(
                      //     "Option 1",
                      //     style: TextStyle(
                      //       fontSize: 24,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      //   onPressed: () {},
                      // ),
                      ,
                      SizedBox(
                        height: 20,
                      ),
                      OptionTile(
                          correctAnswer: questionModel.option1,
                          option: questionModel.option2,
                          optionSelected: optionSelected),
                      // MaterialButton(
                      //   height: 58,
                      //   minWidth: 370,
                      //   shape: RoundedRectangleBorder(
                      //       side: BorderSide(color: Colors.white, width: 2),
                      //       borderRadius: new BorderRadius.circular(15)),
                      //   child: Text(
                      //     "Option 2",
                      //     style: TextStyle(
                      //       fontSize: 24,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      //   onPressed: () {},
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      // MaterialButton(
                      //   height: 58,
                      //   minWidth: 370,
                      //   shape: RoundedRectangleBorder(
                      //       side: BorderSide(color: Colors.white, width: 2),
                      //       borderRadius: new BorderRadius.circular(15)),
                      //   child: Text(
                      //     "Option 3",
                      //     style: TextStyle(
                      //       fontSize: 24,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      //   onPressed: () {},
                      // ),
                      OptionTile(
                          correctAnswer: questionModel.option1,
                          option: questionModel.option3,
                          optionSelected: optionSelected),
                      SizedBox(
                        height: 20,
                      ),
                      OptionTile(
                          correctAnswer: questionModel.option1,
                          option: questionModel.option4,
                          optionSelected: optionSelected),
                      // MaterialButton(
                      //   height: 58,
                      //   minWidth: 370,
                      //   shape: RoundedRectangleBorder(
                      //       side: BorderSide(color: Colors.white, width: 2),
                      //       borderRadius: new BorderRadius.circular(15)),
                      //   child: Text(
                      //     "Option 4",
                      //     style: TextStyle(
                      //       fontSize: 24,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      //   onPressed: () {},
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 60.0),
                        child: MaterialButton(
                            height: 58,
                            minWidth: 250,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30)),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            color: Colors.white,
                            onPressed: () {}),
                      ),
                    ]),
              ),
            ),
    );
  }
}
