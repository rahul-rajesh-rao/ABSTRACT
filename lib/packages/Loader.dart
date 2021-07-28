import 'dart:convert';
import 'package:abstract_mp/packages/loading.dart';

import "QuestionModel.dart";
import 'Question.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

import 'Quiz.dart';

class Api {
  final String tpid, difficulty;
  late final value;
  var response = false;
  Api(this.tpid, this.difficulty);

  Future<List> getJson() async {
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
    print(decodedResponse);
    return value;
  }
}

class Loader extends StatefulWidget {
  final String tpid, difficulty;
  Loader(this.tpid, this.difficulty);
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  late var questionList;
  @override
  void initState() {
    final api = Api(widget.tpid, widget.difficulty);
    questionList = api.getJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: questionList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Quiz(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return loading();
        });
  }
}
