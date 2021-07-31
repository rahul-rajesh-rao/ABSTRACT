class QuestionModel {
  QuestionModel(
      {required this.question,
      required this.answers,
      required this.correctAnswerIndex});
  factory QuestionModel.fromQuestionModel(String question, String option1,
      String option2, String option3, String option4) {
    final List<String> answers = []
      ..add(option1)
      ..add(option2)
      ..add(option3)
      ..add(option4)
      ..shuffle();
    final index = answers.indexOf(option1);
    return QuestionModel(
        question: question, answers: answers, correctAnswerIndex: index);
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
