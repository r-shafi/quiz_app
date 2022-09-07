class TriviaModel {
  final String trivia;
  final bool answer;

  TriviaModel({required this.trivia, required this.answer});

  factory TriviaModel.fromJson(List json) {
    return TriviaModel(
      trivia: json[0],
      answer: json[1],
    );
  }
}
