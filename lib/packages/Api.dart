import 'dart:convert';
import "QuestionModel.dart";
import 'Question.dart';
import "package:http/http.dart" as http;

class Api {
  final String tpid, difficulty;
  late final value;
  var response = false;
  Api(this.tpid, this.difficulty);

  void getJson() async {
    final apiurl = Uri.parse(
        "http://opentdb.com/api.php?amount=10&category=$tpid&difficulty=$difficulty&type=multiple");
    final webResponse = await http.get(apiurl);
    if (webResponse.statusCode == 200) {
      response = true;
    }
    final decodedResponse = jsonDecode(webResponse.body);
    final result = (decodedResponse['results'] as List)
        .map((question) => QuestionModel.fromJson(question));
    value =
        result.map((question) => Question.fromQuestionModel(question)).toList();
    print(value);
    print(decodedResponse);
  }
}

//

// final jsonResponse = convert.jsonDecode(response.body);
// final result = (jsonResponse[‘results’] as List)
// .map((question) => QuestionModel.fromJson(question));
//questions.value = result
// .map((question) => Question.fromQuestionModel(question))
// .toList();
