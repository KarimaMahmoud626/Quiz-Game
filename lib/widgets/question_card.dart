import 'package:flutter/material.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/core/utils/size_config.dart';
import 'package:quiz_game/widgets/timer_counter.dart';

class QuestionCard extends StatelessWidget {
  final String questionText;
  final String quizTitle;
  final String questionNumber;
  final bool? isLoading;
  final int timerSeconds;
  final double progress;

  const QuestionCard({
    super.key,
    required this.questionText,
    required this.quizTitle,
    required this.questionNumber,
    this.isLoading = false,
    required this.timerSeconds,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child:
          isLoading!
              ? Center(child: CircularProgressIndicator())
              : Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: SizeConfig.defaultSize! * 3),
                      Text(
                        questionNumber,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        quizTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      const Divider(height: 30, color: Colors.white10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          '"$questionText"',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            height: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.defaultSize! * 1.5),
                    ],
                  ),
                  Positioned(
                    top: -(SizeConfig.defaultSize! * 6),
                    left: 0,
                    right: 0,
                    child: Center(
                      child: TimerCounter(
                        timerSeconds: timerSeconds,
                        progress: progress,
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
