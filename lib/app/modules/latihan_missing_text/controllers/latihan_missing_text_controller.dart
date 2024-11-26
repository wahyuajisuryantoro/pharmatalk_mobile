import 'package:get/get.dart';
import 'package:bahasaku/models/quiz.dart';
import 'package:bahasaku/app/routes/app_pages.dart';

class LatihanMissingTextController extends GetxController {
  var currentQuestionIndex = 0.obs;

  var score = 0.obs;

  late List<QuizQuestion> questions;

  var userAnswers = <int, String>{}.obs;

  var isQuizFinished = false.obs;

  var isPreview = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadQuestions();
  }

  void _loadQuestions() {
    questions = [
      QuizQuestion(
        character: 'Pharmacist',
        dialogue:
            "Let's start with the Dextromethorphan. Do you have 20 mg measured out?",
      ),
      QuizQuestion(
        character: 'Assistant',
        dialogue: "Yes, I’ve got it. ...",
        options: [
          "It’s dissolved. What’s next?",
          "Done. Should I add the sweetener now?",
          "It looks smooth now. Ready to package?",
          "Alright. I’ll label it with ‘5 mL every 4 hours’ and ‘Store in a cool, dry place.’ Done!",
          "Should I mix it with the water now?",
        ],
        correctAnswer: "Should I mix it with the water now?",
        isUserAnswer: true,
      ),
      QuizQuestion(
        character: 'Pharmacist',
        dialogue: "Yes, mix it well to dissolve completely.",
      ),
      QuizQuestion(
        character: 'Assistant',
        dialogue: "[Mixing] \"...\"",
        options: [
          "It’s dissolved. What’s next?",
          "Done. Should I add the sweetener now?",
          "It looks smooth now. Ready to package?",
          "Alright. I’ll label it with ‘5 mL every 4 hours’ and ‘Store in a cool, dry place.’ Done!",
          "Should I mix it with the water now?",
        ],
        correctAnswer: "It’s dissolved. What’s next?",
        isUserAnswer: true,
      ),
      QuizQuestion(
        character: 'Pharmacist',
        dialogue: "Now, add the cherry flavor and stir it in.",
      ),
      QuizQuestion(
        character: 'Assistant',
        dialogue: "[Adds flavor and stirs] \"...\"",
        options: [
          "It’s dissolved. What’s next?",
          "Done. Should I add the sweetener now?",
          "It looks smooth now. Ready to package?",
          "Alright. I’ll label it with ‘5 mL every 4 hours’ and ‘Store in a cool, dry place.’ Done!",
          "Should I mix it with the water now?",
        ],
        correctAnswer: "Done. Should I add the sweetener now?",
        isUserAnswer: true,
      ),
      QuizQuestion(
        character: 'Pharmacist',
        dialogue: "Yes, add it slowly and keep stirring until it looks smooth.",
      ),
      QuizQuestion(
        character: 'Assistant',
        dialogue: "[Adds sweetener] \"...\"",
        options: [
          "It’s dissolved. What’s next?",
          "Done. Should I add the sweetener now?",
          "It looks smooth now. Ready to package?",
          "Alright. I’ll label it with ‘5 mL every 4 hours’ and ‘Store in a cool, dry place.’ Done!",
          "Should I mix it with the water now?",
        ],
        correctAnswer: "It looks smooth now. Ready to package?",
        isUserAnswer: true,
      ),
      QuizQuestion(
        character: 'Pharmacist',
        dialogue:
            "Almost. Check that it’s mixed evenly, then label it with dosage and storage instructions.",
      ),
      QuizQuestion(
        character: 'Assistant',
        dialogue: "\"...\"",
        options: [
          "It’s dissolved. What’s next?",
          "Done. Should I add the sweetener now?",
          "It looks smooth now. Ready to package?",
          "Alright. I’ll label it with ‘5 mL every 4 hours’ and ‘Store in a cool, dry place.’ Done!",
          "Should I mix it with the water now?",
        ],
        correctAnswer:
            "Alright. I’ll label it with ‘5 mL every 4 hours’ and ‘Store in a cool, dry place.’ Done!",
        isUserAnswer: true,
      ),
      QuizQuestion(
        character: 'Pharmacist',
        dialogue:
            "Good job. Following each step carefully makes all the difference.",
      ),
    ];
  }

  void startQuiz() {
    isPreview.value = false;
  }

  void selectAnswer(String answer) {
    var question = questions[currentQuestionIndex.value];

    String? previousAnswer = userAnswers[currentQuestionIndex.value];

    bool wasCorrect = previousAnswer == question.correctAnswer;

    userAnswers[currentQuestionIndex.value] = answer;

    bool isCorrect = answer == question.correctAnswer;

    if (previousAnswer != null) {
      if (wasCorrect && !isCorrect) {
        score.value -= 1;
      } else if (!wasCorrect && isCorrect) {
        score.value += 1;
      }
    } else {
      if (isCorrect) {
        score.value += 1;
      }
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value += 1;
    } else {
      isQuizFinished.value = true;
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value -= 1;
    }
  }

  void backToLatihan() {
    Get.toNamed(Routes.LATIHAN);
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    userAnswers.clear();
    isQuizFinished.value = false;
    isPreview.value = true;
  }

  bool isAnswered() {
    var question = questions[currentQuestionIndex.value];
    if (question.isUserAnswer) {
      return userAnswers.containsKey(currentQuestionIndex.value);
    } else {
      return true;
    }
  }
}
