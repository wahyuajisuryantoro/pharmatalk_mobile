import 'package:get/get.dart';
import '../models/step_item_models.dart';

class LatihanArrangeTextController extends GetxController {
  // Daftar langkah dalam urutan yang benar
  final List<StepItem> correctOrder = [
    StepItem(id: 1, text: "Measure the active ingredient (Dextromethorphan) carefully to ensure the correct dosage."),
    StepItem(id: 2, text: "Mix the Dextromethorphan with distilled water to create a uniform solution."),
    StepItem(id: 3, text: "Add the flavoring agent and the sweetener to the solution, mixing well after each addition."),
    StepItem(id: 4, text: "Check the consistency and appearance of the syrup to ensure it is uniform."),
    StepItem(id: 5, text: "Label and package the syrup with information about dosage, storage, and expiry."),
  ];

  // List untuk menyimpan urutan langkah saat ini
  final RxList<StepItem> currentOrder = <StepItem>[].obs;

  // Status drag and drop
  final isDragging = false.obs;

  // Skor pengguna
  final score = 0.obs;

  // Menandai apakah kuis sudah selesai
  final isQuizFinished = false.obs;

  // Menandai apakah pengguna sedang melihat preview
  final isPreviewMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    initializeQuiz();
  }

  void initializeQuiz() {
    // Mengacak urutan dan menyimpannya ke currentOrder
    currentOrder.value = List<StepItem>.from(correctOrder)..shuffle();
  }

  void reorderItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final StepItem item = currentOrder.removeAt(oldIndex);
    currentOrder.insert(newIndex, item);
  }

  void submitAnswer() {
    int correctCount = 0;
    for (int i = 0; i < currentOrder.length; i++) {
      if (currentOrder[i].id == correctOrder[i].id) {
        correctCount++;
      }
    }
    score.value = correctCount;
    isQuizFinished.value = true;
  }

  void resetQuiz() {
    initializeQuiz();
    score.value = 0;
    isQuizFinished.value = false;
  }

  void backToLatihan() {
    Get.back();
  }

  void startQuiz() {
    isPreviewMode.value = false;
  }
}
