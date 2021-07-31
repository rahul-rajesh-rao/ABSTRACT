class CreateQuestionMap {
  Map<String, String> questionMap;
  CreateQuestionMap(this.questionMap);
  factory CreateQuestionMap.mapQuestion(Map<String, String> questionMap) {
    return CreateQuestionMap(questionMap);
  }
}
