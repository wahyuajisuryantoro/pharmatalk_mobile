import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class VisualVideoController extends GetxController {
  final List<Map<String, String>> videoList = [
    {
      'url': 'https://youtu.be/UdakI1zk0xE?si=e1D0yw0NuxTQdEqe',
      'title':
          'At the pharmacy - Everyday English Conversation (at the drugstore) English Conversation Practice'
    },
    {
      'url': 'https://youtu.be/KqioUrn6A4k?si=V51kMLAQeDItG1wO',
      'title': 'At the Pharmacy | Daily English Conversations | Fluent English'
    },
    {
      'url': 'https://youtu.be/0bgCg8Af_F8?si=ub19HJFlqomu3XeW',
      'title': 'AT THE PHARMACY'
    },
    {
      'url': 'https://youtu.be/37ROx6B0H4k?si=DoBGa2c65z1MlDJr',
      'title':
          'I need medicine. Do you have a prescription? Pharmacy vocabulary. English drugstore dialogues'
    }
  ];

  Rx<YoutubePlayerController?> currentVideoController =
      Rx<YoutubePlayerController?>(null);
  RxInt selectedVideoIndex = RxInt(-1);
  RxBool isFullScreen = RxBool(false);

  @override
  void onClose() {
    disposeVideoController();
    super.onClose();
  }

  void playVideo(int index) {
    if (selectedVideoIndex.value == index) return;

    disposeVideoController();

    String? videoId = YoutubePlayer.convertUrlToId(videoList[index]['url']!);

    if (videoId != null) {
      currentVideoController.value = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: true,
        ),
      )..addListener(videoListener);

      selectedVideoIndex.value = index;
    }
  }

  void videoListener() {
    if (currentVideoController.value?.value.hasError ?? false) {
      print('Video Error: ${currentVideoController.value?.value.errorCode}');
    }
  }

  void toggleFullScreen(bool fullScreen) {
    isFullScreen.value = fullScreen;
  }

  void disposeVideoController() {
    if (currentVideoController.value != null) {
      currentVideoController.value?.removeListener(videoListener);
      currentVideoController.value?.dispose();
      currentVideoController.value = null;
      selectedVideoIndex.value = -1;
      isFullScreen.value = false;
    }
  }

  String getVideoThumbnail(String url) {
    String? videoId = YoutubePlayer.convertUrlToId(url);
    return videoId != null ? 'https://img.youtube.com/vi/$videoId/0.jpg' : '';
  }

  void resetOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
