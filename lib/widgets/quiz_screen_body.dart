import 'package:flutter/material.dart';
import 'package:quiz_game/widgets/question_card.dart';

class QuizScreenBody extends StatelessWidget {
  const QuizScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [QuestionCard()]);
  }
}
