import 'package:abstract_mp/packages/apiquestionmodel.dart';
import 'package:abstract_mp/packages/loading.dart';
import 'package:abstract_mp/packages/play.dart';
import 'package:abstract_mp/service/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StartQuiz extends StatefulWidget {
  final String quizId;
  String difficulty, madeby, topic;
  StartQuiz(this.quizId, this.topic, this.difficulty, this.madeby);

  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  late final questionModel;
  String optionSelected = "";
  late final QuerySnapshot questionSnaphot;
  late var questionList;
  DatabaseService databaseService = new DatabaseService();
  bool isLoading = true;
  @override
  void initState() {
    questionList = getQuestions();
    print("${widget.quizId}");
    super.initState();
  }

  Future<List> getQuestions() async {
    await databaseService.getQuestionData(widget.quizId).then((value) {
      questionSnaphot = value;
      print("questions incoming");
      setState(() {});
    });
    final rawQuestionList = questionSnaphot.docs;
    final questionList = rawQuestionList
        .map((e) => QuestionModel.fromQuestionModel(e['question'], e['option1'],
            e['option2'], e['option3'], e['option4']))
        .toList();
    return questionList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: questionList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Play(
                snapshot.data!, widget.topic, widget.difficulty, widget.madeby);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return loading();
        });
  }
}
