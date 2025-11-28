import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/core/utils/size_config.dart';
import 'package:quiz_game/cubits/cubit/quiz_cubit.dart';
import 'package:quiz_game/services/firestore_service.dart';
import 'package:quiz_game/widgets/quiz_screen_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.quizType});

  final String quizType;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create:
          (context) => QuizCubit(FirestoreService())..fetchQuestions(quizType),
      child: Scaffold(
        backgroundColor: AppColors.primaryDark,
        body: QuizScreenBody(quizType: quizType),
      ),
    );
  }
}
