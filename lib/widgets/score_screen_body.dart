import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/core/utils/size_config.dart';
import 'package:quiz_game/cubits/cubit/quiz_cubit.dart';
import 'package:quiz_game/screens/quiz_type_screen.dart';
import 'package:quiz_game/screens/splash_screen.dart';
import 'package:quiz_game/widgets/custom_text_button.dart';

class ScoreScreenBody extends StatelessWidget {
  const ScoreScreenBody({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 5,
            vertical: SizeConfig.defaultSize! * 18,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Score',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
                const Divider(height: 30, color: AppColors.optionBorder),
                SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.defaultSize! * 10,
                      width: SizeConfig.defaultSize! * 10,
                      child: CircularProgressIndicator(
                        value: score / 10,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        strokeWidth: 5,
                        color:
                            score >= 5
                                ? AppColors.primaryPurple
                                : Colors.orangeAccent,
                      ),
                    ),
                    Positioned(
                      child: Text(
                        '$score/10',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  (score >= 5) ? 'You Win!' : 'You Loss!',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                SizedBox(height: SizeConfig.defaultSize! * 4),
                CustomTextButton(
                  text: 'اللعب مجددًا',
                  onTap: () {
                    Get.to(() => QuizTypeScreen());
                    context.read<QuizCubit>().restartQuiz();
                  },
                ),
                SizedBox(height: SizeConfig.defaultSize! * 2),
                CustomTextButton(
                  text: '🏠',
                  onTap: () {
                    Get.to(() => SplashScreen());
                    context.read<QuizCubit>().restartQuiz();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
