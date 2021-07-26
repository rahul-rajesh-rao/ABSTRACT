import 'QuestionModel.dart';

class Question {
  Question(
      {required this.question,
      required this.answers,
      required this.correctAnswerIndex});

  factory Question.fromQuestionModel(QuestionModel model) {
    final List<String> answers = []
      ..add(model.correctAnswer)
      ..addAll(model.incorrectAnswers)
      ..shuffle();
    final index = answers.indexOf(model.correctAnswer);
    return Question(
        question: model.question, answers: answers, correctAnswerIndex: index);
  }
  String question;
  List<String> answers;
  int correctAnswerIndex;
  int chosenAnswerIndex = 0;

  bool isCorrect(String answer) {
    return answers.indexOf(answer) == correctAnswerIndex;
  }

  bool isChosen(String answer) {
    return answers.indexOf(answer) == chosenAnswerIndex;
  }
}
