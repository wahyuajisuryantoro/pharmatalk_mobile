import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LatihanMatchTextController extends GetxController {
  final pairs = <MapEntry<String, String>>[];

  final leftItems = <String>[].obs;
  final rightItems = <String>[].obs;

  final selectedLeft = Rxn<String>();
  final selectedRight = Rxn<String>();

  final userPairs = <String, String>{};

  final score = 0.obs;
  final isGameComplete = false.obs;
  final grade = ''.obs;

  @override
  void onInit() {
    super.onInit();

    pairs.addAll([
      MapEntry('Active Ingredient',
          'The main component in a drug responsible for its therapeutic effect.'),
      MapEntry('Compounding',
          'The process of mixing different ingredients to create a medication.'),
      MapEntry(
          'Dosage', 'The amount of medicine that should be taken at one time.'),
      MapEntry('Consistency',
          'The property that makes a substance be similarly behaving like other parts'),
      MapEntry('Quality Control',
          'The process of ensuring that a product meets the required standards of purity, strength, and safety.'),
      MapEntry('Sterility',
          'Keeping a medication free from bacteria or contaminants.'),
      MapEntry('Labeling',
          'Information provided on a product about how it should be used, including dosage and warnings.'),
      MapEntry(
          'Sweetener', 'A substance added to make a medication taste better.'),
      MapEntry('Dilution',
          'Adding a liquid to make a solution weaker or less concentrated.'),
      MapEntry('Storage',
          'Conditions under which a product should be kept to remain effective.'),
    ]);

    leftItems.assignAll(pairs.map((e) => e.key).toList()..shuffle());
    rightItems.assignAll(pairs.map((e) => e.value).toList()..shuffle());
  }

  void selectLeft(String item) {
    selectedLeft.value = item;
    print('Selected Left: $item');
  }

  void selectRight(String item) async {
    selectedRight.value = item;
    print('Selected Right: $item');

    await Future.delayed(Duration(milliseconds: 50));

    checkPair();
  }

  void checkPair() async {
    if (selectedLeft.value != null && selectedRight.value != null) {
      await Future.delayed(Duration(milliseconds: 300));

      userPairs[selectedLeft.value!] = selectedRight.value!;

      leftItems.remove(selectedLeft.value);
      rightItems.remove(selectedRight.value);

      selectedLeft.value = null;
      selectedRight.value = null;

      if (leftItems.isEmpty && rightItems.isEmpty) {
        isGameComplete.value = true;
        calculateScore();
      }
    }
  }

  void calculateScore() {
    int correctMatches = 0;
    userPairs.forEach((key, value) {
      final correctPair = pairs.firstWhere(
        (pair) => pair.key == key && pair.value == value,
        orElse: () => MapEntry('', ''),
      );
      if (correctPair.key.isNotEmpty) {
        correctMatches++;
      }
    });
    score.value = (correctMatches / pairs.length * 100).round();

    final accuracy = correctMatches / pairs.length * 100;
    if (accuracy >= 90) {
      grade.value = 'A';
    } else if (accuracy >= 80) {
      grade.value = 'B';
    } else if (accuracy >= 70) {
      grade.value = 'C';
    } else if (accuracy >= 60) {
      grade.value = 'D';
    } else {
      grade.value = 'E';
    }
  }

  void resetGame() {
    pairs.assignAll([
      MapEntry('Active Ingredient',
          'The main component in a drug responsible for its therapeutic effect.'),
      MapEntry('Compounding',
          'The process of mixing different ingredients to create a medication.'),
      MapEntry(
          'Dosage', 'The amount of medicine that should be taken at one time.'),
      MapEntry('Consistency',
          'The property that makes a substance be similarly behaving like other parts'),
      MapEntry('Quality Control',
          'The process of ensuring that a product meets the required standards of purity, strength, and safety.'),
      MapEntry('Sterility',
          'Keeping a medication free from bacteria or contaminants.'),
      MapEntry('Labeling',
          'Information provided on a product about how it should be used, including dosage and warnings.'),
      MapEntry(
          'Sweetener', 'A substance added to make a medication taste better.'),
      MapEntry('Dilution',
          'Adding a liquid to make a solution weaker or less concentrated.'),
      MapEntry('Storage',
          'Conditions under which a product should be kept to remain effective.'),
    ]);

    leftItems.assignAll(pairs.map((e) => e.key).toList()..shuffle());
    rightItems.assignAll(pairs.map((e) => e.value).toList()..shuffle());

    userPairs.clear();
    score.value = 0;
    isGameComplete.value = false;
    selectedLeft.value = null;
    selectedRight.value = null;
    grade.value = '';
  }

  void backToLatihan() {
    Get.toNamed(Routes.LATIHAN);
  }
}
