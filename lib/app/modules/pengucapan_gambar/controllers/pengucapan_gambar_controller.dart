import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PengucapanGambarController extends GetxController {
  final currentIndex = 0.obs;
  final FlutterTts flutterTts = FlutterTts();
  final isLoading = false.obs;

  final List<String> materiImages = [
    'assets/images/gambar1.png',
    'assets/images/gambar2.png',
    'assets/images/gambar3.png',
    'assets/images/gambar4.png',
  ];

  final List<String> titles = [
    'Mortar and Pestle',
    'Scale',
    'Spatula',
    'Pipettes',
  ];

  @override
  void onInit() {
    super.onInit();
    _initTts();
  }

  Future<void> _initTts() async {
    try {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setVolume(1.0);
      await flutterTts.setPitch(1.0);
      
      // Tambahkan handler untuk iOS
      await flutterTts.setSharedInstance(true);
      await flutterTts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.ambient,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        ],
      );
    } catch (e) {
      print("Error initializing TTS: $e");
    }
  }

  Future<void> speak(int index) async {
    try {
      isLoading.value = true;
      await flutterTts.stop(); // Stop any ongoing speech
      await flutterTts.speak(titles[index]);
    } catch (e) {
      print("Error speaking: $e");
      Get.snackbar(
        'Error',
        'Unable to play speech. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void nextPage() {
    if (currentIndex.value < materiImages.length - 1) {
      currentIndex.value++;
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  void backToPengucapan() {
    Get.toNamed(Routes.PENGUCAPAN);
  }

  @override
  void onClose() {
    flutterTts.stop();
    super.onClose();
  }
}