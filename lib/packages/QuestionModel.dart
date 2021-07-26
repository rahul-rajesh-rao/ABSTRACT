class QuestionModel {
  QuestionModel(
      {required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers});
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        question: json['question'],
        correctAnswer: json['correct_answer'],
        incorrectAnswers: (json['incorrect_answers'] as List)
            .map((answer) => answer.toString())
            .toList());
  }
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;
}
