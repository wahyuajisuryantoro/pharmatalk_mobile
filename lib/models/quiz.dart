class QuizQuestion {
  final String character;
  final String dialogue;
  final List<String>? options;
  final String? correctAnswer;
  final bool isUserAnswer;

  QuizQuestion({
    required this.character,
    required this.dialogue,
    this.options,
    this.correctAnswer,
    this.isUserAnswer = false,
  });
}
