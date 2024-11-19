import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:bahasaku/app/routes/app_pages.dart';

class PengucapanPenjelasanController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final isLoading = false.obs;
  final speechRate = 0.5.obs;

  // Track currently playing item
  final currentlyPlayingIndex = RxnInt();
  final isPlaying = false.obs;
  final currentProgress = 0.0.obs;
  final totalDuration = 0.0.obs;

  // Store last position for resume functionality
  String? lastSpokenText;

  // Track if the page is active
  final isPageActive = true.obs;

  final List<Map<String, String>> data = [
    {
      'title': 'Active Ingredient',
      'explanation': 'The main component in a drug responsible for its therapeutic effect.'
    },
    {
      'title': 'Compounding',
      'explanation': 'The process of mixing different ingredients to create a medication.'
    },
    {
      'title': 'Dosage',
      'explanation': 'The amount of medicine that should be taken at one time.'
    },
    {
      'title': 'Consistency',
      'explanation': 'The stability and uniformity of a mixture, ensuring that each part is the same.'
    },
    {
      'title': 'Quality Control',
      'explanation': 'The process of ensuring that a product meets the required standards of purity, strength, and safety.'
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _initTts();
  }

  @override
  void onReady() {
    super.onReady();
    reactivatePage(); // Pastikan halaman aktif saat pengguna kembali
  }

  Future _initTts() async {
    try {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(speechRate.value);
      await flutterTts.setVolume(1.0);
      await flutterTts.setPitch(1.0);

      // Add completion handler
      flutterTts.setCompletionHandler(() {
        if (isPageActive.value) {
          stopSpeaking();
        }
      });

      // Add progress handler
      flutterTts.setProgressHandler(
        (String text, int start, int length, String word) {
          if (totalDuration.value > 0 && isPageActive.value) {
            currentProgress.value = start / length;
          }
        },
      );

      // iOS specific settings
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

  Future<void> toggleSpeaking(int index) async {
    if (!isPageActive.value) return;

    if (currentlyPlayingIndex.value == index && isPlaying.value) {
      await pauseSpeaking();
    } else if (currentlyPlayingIndex.value == index && !isPlaying.value) {
      await resumeSpeaking();
    } else {
      await startSpeaking(index);
    }
  }

  Future<void> startSpeaking(int index) async {
    if (!isPageActive.value) return;

    try {
      // Stop any current playback
      if (currentlyPlayingIndex.value != null) {
        await stopSpeaking();
      }

      currentlyPlayingIndex.value = index;
      isPlaying.value = true;

      final title = data[index]['title']!;
      final explanation = data[index]['explanation']!;
      lastSpokenText = "$title. $explanation";

      await flutterTts.speak(lastSpokenText!);

      // Estimate duration (rough approximation)
      totalDuration.value = lastSpokenText!.length * 0.1;
    } catch (e) {
      print("Error speaking: $e");
      if (isPageActive.value) {
        Get.snackbar(
          'Error',
          'Unable to play speech. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<void> pauseSpeaking() async {
    try {
      await flutterTts.pause();
      isPlaying.value = false;
    } catch (e) {
      print("Error pausing speech: $e");
    }
  }

  Future<void> resumeSpeaking() async {
    if (!isPageActive.value) return;

    try {
      if (lastSpokenText != null) {
        isPlaying.value = true;
        await flutterTts.speak(lastSpokenText!);
      }
    } catch (e) {
      print("Error resuming speech: $e");
    }
  }

  Future<void> stopSpeaking() async {
    try {
      await flutterTts.stop();
      isPlaying.value = false;
      currentlyPlayingIndex.value = null;
      currentProgress.value = 0.0;
      totalDuration.value = 0.0;
    } catch (e) {
      print("Error stopping speech: $e");
    }
  }

  Future setSpeechRate(double rate) async {
    if (!isPageActive.value) return;

    try {
      speechRate.value = rate;
      await flutterTts.setSpeechRate(rate);
    } catch (e) {
      print("Error setting speech rate: $e");
    }
  }

  void backToPengucapan() {
    // Set page as inactive before navigation
    isPageActive.value = false;

    // Stop any ongoing speech
    stopSpeaking();

    // Navigate back
    Get.toNamed(Routes.PENGUCAPAN);
  }

  // Add method to reactivate the page
  void reactivatePage() {
    isPageActive.value = true;
    _initTts(); // Reinitialize TTS
  }

  @override
  void onClose() {
    flutterTts.stop();
    super.onClose();
  }
}
