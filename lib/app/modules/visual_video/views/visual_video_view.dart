import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controllers/visual_video_controller.dart';

class VisualVideoView extends GetView<VisualVideoController> {
  const VisualVideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isFullScreen.value) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }

      return WillPopScope(
        onWillPop: () async {
          if (controller.isFullScreen.value) {
            controller.toggleFullScreen(false);
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: controller.isFullScreen.value
              ? null
              : AppBar(
                  backgroundColor: AppColors.skyBlue,
                  title: Text(
                    'Pharmacy English Videos',
                    style: AppText.largeTextBold(color: AppColors.white),
                  ),
                ),
          body: Column(
            children: [
              Obx(() {
                final videoController = controller.currentVideoController.value;
                return videoController != null
                    ? YoutubePlayerBuilder(
                        onEnterFullScreen: () {
                          controller.toggleFullScreen(true);
                        },
                        onExitFullScreen: () {
                          controller.toggleFullScreen(false);
                        },
                        player: YoutubePlayer(
                          controller: videoController,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: AppColors.skyBlue,
                          bottomActions: const [
                            CurrentPosition(),
                            ProgressBar(isExpanded: true),
                            RemainingDuration(),
                            FullScreenButton(),
                          ],
                        ),
                        builder: (context, player) {
                          return Column(
                            children: [
                              player,
                              if (!controller.isFullScreen.value &&
                                  controller.selectedVideoIndex.value != -1)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.videoList[controller
                                        .selectedVideoIndex.value]['title']!,
                                    style: AppText.mediumTextMedium(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          'Select a video to play',
                          style: AppText.mediumTextMedium(),
                        ),
                      );
              }),
              if (!controller.isFullScreen.value)
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.videoList.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        bool isSelected =
                            controller.selectedVideoIndex.value == index;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              if (isSelected) {
                                controller.disposeVideoController();
                              } else {
                                controller.playVideo(index);
                              }
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.network(
                                        controller.getVideoThumbnail(controller
                                            .videoList[index]['url']!),
                                        width: 120,
                                        height: 90,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            width: 120,
                                            height: 90,
                                            color: AppColors.lightGrey,
                                            child: const Icon(
                                                Icons.video_library,
                                                color: AppColors.darkGrey),
                                          );
                                        },
                                      ),
                                      Icon(
                                        Icons.play_circle_fill,
                                        color: AppColors.white.withOpacity(0.8),
                                        size: 50,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: AppColors.skyBlue,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        controller.videoList[index]['title']!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppText.mediumTextBold(
                                            color: AppColors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
