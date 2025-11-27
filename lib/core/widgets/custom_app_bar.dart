import 'package:flutter/material.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: SizeConfig.screenHeight! * 0.3,
        width: SizeConfig.screenWidth! * 0.99,
        decoration: BoxDecoration(
          color: AppColors.primaryPurple,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(100, 50),
            bottomRight: Radius.elliptical(100, 50),
          ),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
