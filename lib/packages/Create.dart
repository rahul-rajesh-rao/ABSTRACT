import 'package:abstract_mp/packages/Questions.dart';
import 'package:abstract_mp/service/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'dart:math';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  //CollectionReference quiz = FirebaseFirestore.instance.collection("quiz");
  String quizTitle = "", quizDifficulty = "";

  DatabaseService databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();
  String quizId = "";
  bool isLoading = false;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  createQuiz() {
    quizId = getRandomString(16);
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      Map<String, dynamic> quizData = {
        "quizTitle": quizTitle,
        "quizDifficulty": quizDifficulty,
        "quizId": quizId,
      };

      databaseService.addQuizData(quizData, quizId).then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Questions(quizId)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#012A4A"),
        appBar: AppBar(
          backgroundColor: HexColor("#012A4A"),
        ),
        body: isLoading
            ? Container(
                child: Center(
                    child: LinearProgressIndicator(
                  backgroundColor: Colors.blue[800],
                  minHeight: 20,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )),
              )
            : Form(
                key: _formKey,
                child: SizedBox(
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
                            child: Text("Create Quiz ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                          Text("Quiz Title:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w300,
                              )),
                          SizedBox(
                            height: 7,
                          ),
                          new TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xF5F1F1).withOpacity(0.4),
                            ),
                            validator: (val) {
                              return val!.isEmpty ? "Enter the Title" : null;
                            },
                            onChanged: (val) {
                              quizTitle = val;
                            },
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text("Quiz Difficulty:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w300,
                              )),
                          SizedBox(
                            height: 7,
                          ),
                          new TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xF5F1F1).withOpacity(0.4),
                            ),
                            validator: (val) {
                              return val!.isEmpty
                                  ? "Enter the Difficulty"
                                  : null;
                            },
                            onChanged: (val) {
                              quizDifficulty = val;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 100, horizontal: 60.0),
                            child: MaterialButton(
                                height: 58,
                                minWidth: 250,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30)),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  createQuiz();
                                  // addQuiz(quizTitle, quizDifficulty);
                                  // await quiz.add({
                                  //   "quizTitle": quizTitle,
                                  //   "quizDifficulty": quizDifficulty,
                                  //   "id": quiz.id,
                                  // }).catchError((e) {
                                  //   print(e);
                                  // });
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Questions()));
                                }),
                          ),
                        ]),
                  ),
                ),
              ));
  }
}
