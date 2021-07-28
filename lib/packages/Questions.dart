import 'package:abstract_mp/packages/CreateQuestionMap.dart';
import 'package:abstract_mp/packages/UploadQuestion.dart';
import 'package:abstract_mp/service/database_service.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'CreateQuestionMap.dart';

class Questions extends StatefulWidget {
  final String quizId;
  final Map<String, dynamic> quizData;
  Questions(this.quizId, this.quizData);
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  DatabaseService databaseService = new DatabaseService();
  List finQuestionMap = [];
  final _formKey = GlobalKey<FormState>();
  final maxQuestion = 5;
  var questionNo = 1;
  var noOfQuestion = 0;
  bool isLoading = false;
  String question = "", option1 = "", option2 = "", option3 = "", option4 = "";
  final fieldText = TextEditingController();
  final opt1 = TextEditingController();
  final opt2 = TextEditingController();
  final opt3 = TextEditingController();
  final opt4 = TextEditingController();
  void clearText() {
    fieldText.clear();
    opt1.clear();
    opt2.clear();
    opt3.clear();
    opt4.clear();
  }

  uploadQuestionData(bool add) {
    //todo: add validation before submition
    if (_formKey.currentState!.validate()) {
      if (add) {
        setState(() {});
      }
      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };
      if (noOfQuestion < maxQuestion)
        finQuestionMap.add(CreateQuestionMap.mapQuestion(questionMap));
      finQuestionMap.forEach((element) {
        print(element.questionMap);
      });
      noOfQuestion++;
    } else {
      print("error is happening ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#012A4A"),
        appBar: AppBar(
          backgroundColor: HexColor("#012A4A"),
        ),
        body: Form(
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
                  Row(
                    children: [
                      Text("Question ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          )),
                      Text("$questionNo/$maxQuestion ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Enter the question:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  new TextFormField(
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                    controller: fieldText,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(15.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xF5F1F1).withOpacity(0.4),
                    ),
                    validator: (val) {
                      return val!.isEmpty ? "Enter the Question" : null;
                    },
                    onChanged: (val) {
                      question = val;
                    },
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("Option 1(Correct answer):",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 45,
                    child: new TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: opt1,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xF5F1F1).withOpacity(0.4),
                      ),
                      validator: (val) {
                        return val!.isEmpty ? "Enter the option" : null;
                      },
                      onChanged: (val) {
                        option1 = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("Option 2:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 45,
                    child: new TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: opt2,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xF5F1F1).withOpacity(0.4),
                      ),
                      validator: (val) {
                        return val!.isEmpty ? "Enter the option" : null;
                      },
                      onChanged: (val) {
                        option2 = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("Option 3:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 45,
                    child: new TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: opt3,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xF5F1F1).withOpacity(0.4),
                      ),
                      validator: (val) {
                        return val!.isEmpty ? "Enter the option" : null;
                      },
                      onChanged: (val) {
                        option3 = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("Option 4:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 45,
                    child: new TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: opt4,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xF5F1F1).withOpacity(0.4),
                      ),
                      validator: (val) {
                        return val!.isEmpty ? "Enter the option" : null;
                      },
                      onChanged: (val) {
                        option4 = val;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(290, 15, 0, 0),
                    child: IconButton(
                        color: Colors.white,
                        iconSize: 40,
                        onPressed: () {
                          uploadQuestionData(true);
                          print('no of question $noOfQuestion\n');
                          print('displayed question no$questionNo\n');
                          if (noOfQuestion >= maxQuestion) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content:
                                        Text("Too many questions dipshit!!"),
                                    actions: [
                                      TextButton(
                                        child: Text("Ok"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                          } else {
                            questionNo++;
                          }
                          clearText();
                        },
                        icon: Icon(Icons.add_circle_outline_rounded)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 70,
                    ),
                    child: MaterialButton(
                      height: 50,
                      minWidth: 230,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30)),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        if (noOfQuestion < questionNo) {
                          uploadQuestionData(false);
                        }
                        if (noOfQuestion > 1 && noOfQuestion <= maxQuestion) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UploadQuestion(
                                      finQuestionMap,
                                      widget.quizId,
                                      widget.quizData)));
                        } else if (noOfQuestion < 1) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text(
                                      "Hey you.Yes you there, listen up lad there aren't enough question added to call this mess that you have created a quiz"),
                                  actions: [
                                    TextButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
