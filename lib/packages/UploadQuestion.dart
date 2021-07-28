import 'package:flutter/material.dart';
import 'package:abstract_mp/service/database_service.dart';

import 'NavScreen.dart';

DatabaseService databaseService = new DatabaseService();

class UploadQuestion extends StatefulWidget {
  final List finQuestionMap;
  final String quizId;
  final Map<String, dynamic> quizData;
  UploadQuestion(this.finQuestionMap, this.quizId, this.quizData);
  @override
  _UploadQuestionState createState() => _UploadQuestionState();
}

class _UploadQuestionState extends State<UploadQuestion> {
  var future;
  Future upload(
      List finQuestionMap, String quizId, Map<String, dynamic> quizData) async {
    await databaseService.addQuizData(quizData, quizId);
    finQuestionMap.forEach((element) {
      databaseService.addQuestionData(element.questionMap, widget.quizId);
    });
    return "done";
  }

  @override
  void initState() {
    future = upload(widget.finQuestionMap, widget.quizId, widget.quizData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavScreen();
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(child: Center(child: CircularProgressIndicator()));
        });
  }
}

// }).catchError((e) {
//         print(e);
//       });
//     );
