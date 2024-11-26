import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihan_arrange_text_controller.dart';
import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:bahasaku/utils/app_responsive.dart';

class LatihanArrangeTextView extends GetView<LatihanArrangeTextController> {
  const LatihanArrangeTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Arrange the Steps',
          style: AppText.largeTextBold(color: AppColors.white),
        ),
        backgroundColor: AppColors.skyBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => controller.backToLatihan(),
        ),
      ),
      body: Obx(() {
        if (controller.isPreviewMode.value) {
          return _buildPreviewScreen(context);
        } else if (controller.isQuizFinished.value) {
          return _buildResultScreen(context);
        } else {
          return _buildQuizScreen(context);
        }
      }),
    );
  }

  Widget _buildPreviewScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppResponsive.width(context, 4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            style: AppText.heading2(color: AppColors.charcoal),
          ),
          SizedBox(height: AppResponsive.height(context, 2)),
          ...[
            "1. Active Ingredient: Dextromethorphan (for cough suppression) - 20 mg",
            "2. Flavoring Agent: Cherry flavor - 5 mL",
            "3. Sweetener: Sucrose syrup - 30 mL",
            "4. Distilled Water: 100 mL (for dilution)"
          ].map(
            (ingredient) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle, color: AppColors.skyBlue),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      ingredient,
                      style: AppText.mediumTextRegular(color: AppColors.charcoal),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            label: Text(
              'Start Quiz',
              style: AppText.mediumTextRegular(color: AppColors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.skyBlue,
              minimumSize: Size.fromHeight(AppResponsive.height(context, 6)),
            ),
            onPressed: () => controller.startQuiz(),
          ),
        ],
      ),
    );
  }

  Widget _buildResultScreen(BuildContext context) {
    int totalSteps = controller.correctOrder.length;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppResponsive.width(context, 4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              controller.score.value == totalSteps ? Icons.celebration : Icons.stars,
              size: 64,
              color: AppColors.skyBlue,
            ),
            SizedBox(height: AppResponsive.height(context, 2)),
            Text(
              'Your Score',
              style: AppText.heading2(color: AppColors.charcoal),
            ),
            SizedBox(height: AppResponsive.height(context, 2)),
            Text(
              '${controller.score.value} / $totalSteps',
              style: AppText.display1(color: AppColors.skyBlue),
            ),
            SizedBox(height: AppResponsive.height(context, 4)),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: Text(
                'Try Again',
                style: AppText.mediumTextRegular(color: AppColors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.skyBlue,
                minimumSize: Size.fromHeight(AppResponsive.height(context, 6)),
              ),
              onPressed: () => controller.resetQuiz(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppResponsive.width(context, 4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.skyBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.skyBlue),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Arrange the steps in the correct order by dragging and dropping the items:',
                    style: AppText.mediumTextMedium(color: AppColors.charcoal),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppResponsive.height(context, 2)),
          Expanded(
            child: ReorderableListView.builder(
              itemCount: controller.currentOrder.length,
              itemBuilder: (context, index) {
                final item = controller.currentOrder[index];
                return ListTile(
                  key: ValueKey(item.id),
                  leading: Icon(Icons.drag_indicator, color: AppColors.skyBlue),
                  title: Text(item.text, style: AppText.mediumTextRegular()),
                );
              },
              onReorder: (oldIndex, newIndex) =>
                  controller.reorderItems(oldIndex, newIndex),
            ),
          ),
          SizedBox(height: AppResponsive.height(context, 2)),
          ElevatedButton.icon(
            icon: const Icon(Icons.check_circle_outline),
            label: Text(
              'Submit Answer',
              style: AppText.mediumTextRegular(color: AppColors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.skyBlue,
              minimumSize: Size.fromHeight(AppResponsive.height(context, 6)),
            ),
            onPressed: () => controller.submitAnswer(),
          ),
        ],
      ),
    );
  }
}
