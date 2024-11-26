import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihan_missing_text_controller.dart';
import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LatihanMissingTextView extends GetView<LatihanMissingTextController> {
  const LatihanMissingTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Missing Text !!!',
          style: AppText.largeTextBold(color: AppColors.white),
        ),
        backgroundColor: AppColors.skyBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () {
            controller.backToLatihan();
          },
        ),
      ),
      body: Obx(() {
        if (controller.isPreview.value) {
          return Padding(
            padding: EdgeInsets.all(AppResponsive.width(context, 4)),
            child: Column(
              children: [
                Text(
                  'Please read the dialogue below before starting the exercise.',
                  style: AppText.largeTextMedium(color: AppColors.charcoal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppResponsive.height(context, 2)),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.questions.length,
                    itemBuilder: (context, index) {
                      var question = controller.questions[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppResponsive.height(context, 1)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: AppResponsive.width(context, 10),
                              height: AppResponsive.width(context, 10),
                              margin: EdgeInsets.only(
                                  right: AppResponsive.width(context, 3)),
                              child: SvgPicture.asset(
                                question.character == 'Pharmacist'
                                    ? 'assets/icons/pharmacist.svg'
                                    : 'assets/icons/nurse.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${question.character}:',
                                    style: AppText.mediumTextBold(
                                        color: AppColors.charcoal),
                                  ),
                                  SizedBox(
                                      height:
                                          AppResponsive.height(context, 0.5)),
                                  Text(
                                    question.dialogue,
                                    style: AppText.mediumTextRegular(
                                        color: AppColors.charcoal),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppResponsive.height(context, 2)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.skyBlue,
                    minimumSize:
                        Size.fromHeight(AppResponsive.height(context, 6)),
                  ),
                  onPressed: () {
                    controller.startQuiz();
                  },
                  child: Text(
                    'Next to Exercise!!!',
                    style: AppText.mediumTextRegular(color: AppColors.white),
                  ),
                ),
              ],
            ),
          );
        } else if (controller.isQuizFinished.value) {
          int totalQuestions =
              controller.questions.where((q) => q.isUserAnswer).length;

          return Center(
            child: Padding(
              padding: EdgeInsets.all(AppResponsive.width(context, 4)),
              child: Column(
                children: [
                  Text(
                    'Your Score',
                    style: AppText.heading2(color: AppColors.charcoal),
                  ),
                  SizedBox(height: AppResponsive.height(context, 2)),
                  Text(
                    '${controller.score.value} / $totalQuestions',
                    style: AppText.display1(color: AppColors.skyBlue),
                  ),
                  SizedBox(height: AppResponsive.height(context, 4)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.skyBlue,
                      minimumSize:
                          Size.fromHeight(AppResponsive.height(context, 6)),
                    ),
                    onPressed: () {
                      controller.backToLatihan();
                    },
                    child: Text(
                      'Back to Home',
                      style: AppText.mediumTextRegular(color: AppColors.white),
                    ),
                  ),
                  SizedBox(height: AppResponsive.height(context, 2)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.forestGreen,
                      minimumSize:
                          Size.fromHeight(AppResponsive.height(context, 6)),
                    ),
                    onPressed: () {
                      controller.resetQuiz();
                    },
                    child: Text(
                      'Reset Quiz',
                      style: AppText.mediumTextRegular(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          var question =
              controller.questions[controller.currentQuestionIndex.value];

          return Padding(
            padding: EdgeInsets.all(AppResponsive.width(context, 4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: AppResponsive.width(context, 10),
                      height: AppResponsive.width(context, 10),
                      margin: EdgeInsets.only(
                          right: AppResponsive.width(context, 3)),
                      child: SvgPicture.asset(
                        question.character == 'Pharmacist'
                            ? 'assets/icons/pharmacist.svg'
                            : 'assets/icons/nurse.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${question.character}:',
                        style: AppText.extraLargeTextBold(
                            color: AppColors.charcoal),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppResponsive.height(context, 1)),
                Text(
                  question.dialogue.replaceAll('...', '___'),
                  style: AppText.largeTextRegular(color: AppColors.charcoal),
                ),
                SizedBox(height: AppResponsive.height(context, 3)),
                if (question.isUserAnswer && question.options != null)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose the correct answer:',
                            style: AppText.largeTextMedium(
                                color: AppColors.charcoal),
                          ),
                          SizedBox(height: AppResponsive.height(context, 2)),
                          ...question.options!.map((option) {
                            return RadioListTile<String>(
                              title: Text(
                                option,
                                style: AppText.mediumTextRegular(
                                    color: AppColors.charcoal),
                              ),
                              value: option,
                              groupValue: controller.userAnswers[
                                  controller.currentQuestionIndex.value],
                              activeColor: AppColors.skyBlue,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.selectAnswer(value);
                                }
                              },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  )
                else
                  Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.currentQuestionIndex.value > 0)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.skyBlue,
                          minimumSize: Size(
                            AppResponsive.width(context, 25),
                            AppResponsive.height(context, 6),
                          ),
                        ),
                        onPressed: () {
                          controller.previousQuestion();
                        },
                        child: Text(
                          'Back',
                          style:
                              AppText.mediumTextRegular(color: AppColors.white),
                        ),
                      )
                    else
                      SizedBox(width: AppResponsive.width(context, 25)),
                    if (controller.isAnswered())
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.skyBlue,
                          minimumSize: Size(
                            AppResponsive.width(context, 25),
                            AppResponsive.height(context, 6),
                          ),
                        ),
                        onPressed: () {
                          controller.nextQuestion();
                        },
                        child: Text(
                          'Next',
                          style:
                              AppText.mediumTextRegular(color: AppColors.white),
                        ),
                      )
                    else
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          minimumSize: Size(
                            AppResponsive.width(context, 25),
                            AppResponsive.height(context, 6),
                          ),
                        ),
                        onPressed: null,
                        child: Text(
                          'Next',
                          style:
                              AppText.mediumTextRegular(color: AppColors.white),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
