import 'package:flutter/material.dart';
import 'package:quiz_game/core/widgets/custom_app_bar.dart';
import 'package:quiz_game/widgets/quiz_screen_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEAE4),
      body: QuizScreenBody(),
      appBar: CustomAppBar(pageName: ''),
    );
  }
}
