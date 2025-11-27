import 'package:flutter/material.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/core/utils/size_config.dart';

class TimerCounter extends StatelessWidget {
  const TimerCounter({
    super.key,
    required this.timerSeconds,
    required this.progress,
  });

  final int timerSeconds;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: SizeConfig.defaultSize! * 7,
      width: SizeConfig.defaultSize! * 7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryPurple,
      ),
      child: Container(
        alignment: Alignment.center,
        height: SizeConfig.defaultSize! * 6,
        width: SizeConfig.defaultSize! * 6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.cardDark,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.withOpacity(0.2),
              strokeWidth: 3,
              color:
                  timerSeconds >= 5
                      ? AppColors.primaryOrange
                      : Colors.orangeAccent,
            ),
            Positioned(
              child: Text(
                '$timerSeconds',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
