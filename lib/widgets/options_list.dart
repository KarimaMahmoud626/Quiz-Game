import 'package:flutter/material.dart';
import 'package:quiz_game/models/question_model.dart';
import 'package:quiz_game/widgets/answer_card.dart';

class OptionsList extends StatelessWidget {
  final QuestionModel questionModel;
  final int? selectedIndex;
  final Function(int) onSelect;

  const OptionsList({
    super.key,
    required this.questionModel,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final correctIndex = questionModel.correctAnswerIndex;

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: questionModel.answers.length,
        itemBuilder: (context, index) {
          final bool isPicked = selectedIndex == index;
          final bool isCorrect = index == correctIndex;

          return GestureDetector(
            onTap: () => onSelect(index),
            child: AnswerCard(
              answer: questionModel.answers[index],
              isCorrect: isCorrect,
              isPicked: isPicked,
            ),
          );
        },
      ),
    );
  }
}
