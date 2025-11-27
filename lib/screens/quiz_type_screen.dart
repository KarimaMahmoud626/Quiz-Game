import 'package:flutter/material.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/widgets/quiz_type_body.dart';

class QuizTypeScreen extends StatelessWidget {
  const QuizTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryOrange,
      body: QuizTypeBody(),
    );
  }
}
