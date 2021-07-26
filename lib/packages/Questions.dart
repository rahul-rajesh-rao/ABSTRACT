import 'package:abstract_mp/packages/NavScreen.dart';
import 'package:abstract_mp/service/database_service.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Questions extends StatefulWidget {
  final String quizId;
  Questions(this.quizId);
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  DatabaseService databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  String question = "", option1 = "", option2 = "", option3 = "", option4 = "";
  uploadQuestionData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      await databaseService
          .addQuestionData(questionMap, widget.quizId)
          .then((value) {
        question = "";
        option1 = "";
        option2 = "";
        option3 = "";
        option4 = "";
        setState(() {
          isLoading = false;
        });
      }).catchError((e) {
        print(e);
      });
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
                        SizedBox(
                          height: 45,
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
                                uploadQuestionData();
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavScreen()));
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
