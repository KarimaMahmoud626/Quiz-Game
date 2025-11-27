import 'package:flutter/material.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/widgets/score_screen_body.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: ScoreScreenBody(score: score),
    );
  }
}
