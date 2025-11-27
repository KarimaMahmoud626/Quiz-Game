import 'package:flutter/material.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryOrange,
      body: SplashBody(),
    );
  }
}
