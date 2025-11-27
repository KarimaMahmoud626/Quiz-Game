import 'package:flutter/material.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/core/utils/size_config.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key, this.score});

  final int? score;

  @override
  Widget build(BuildContext context) {
    final previousScore = score;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: SizeConfig.defaultSize! * 5,
        width: SizeConfig.defaultSize! * 13,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryOrange,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.credit_score, size: 18, color: Colors.black),
              SizedBox(width: 4),
              Text(
                'Score: $previousScore',
                style: TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
