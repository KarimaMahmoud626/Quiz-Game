import 'package:flutter/material.dart';
import 'package:quiz_game/core/app_colors.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.answer,
    required this.isPicked,
    required this.isCorrect,
  });

  final String answer;
  final bool isPicked;
  final bool isCorrect;

  Color _getBorderColor() {
    if (!isPicked) return AppColors.optionBorder;

    return isCorrect ? AppColors.correctGreen : AppColors.wrongRed;
  }

  Icon _getIcon() {
    if (!isPicked) {
      return const Icon(Icons.circle_outlined, color: Colors.white54);
    }

    return isCorrect
        ? const Icon(Icons.check_circle, color: AppColors.correctGreen)
        : const Icon(Icons.close_sharp, color: AppColors.wrongRed);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        border: Border.all(color: _getBorderColor(), width: 2),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          _getIcon(),
        ],
      ),
    );
  }
}
