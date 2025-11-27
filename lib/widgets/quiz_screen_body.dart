import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as getx;
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/core/utils/size_config.dart';
import 'package:quiz_game/core/widgets/custom_app_bar.dart';
import 'package:quiz_game/cubits/cubit/quiz_cubit.dart';
import 'package:quiz_game/screens/score_screen.dart';
import 'package:quiz_game/widgets/custom_icon_button.dart';
import 'package:quiz_game/widgets/options_list.dart';
import 'package:quiz_game/widgets/question_card.dart';
import 'package:quiz_game/widgets/score_card.dart';

class QuizScreenBody extends StatelessWidget {
  const QuizScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizCubit, QuizState>(
      listener: (context, state) {
        if (state is QuizFinished) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.to(
              () => BlocProvider.value(
                value: context.read<QuizCubit>(),
                child: ScoreScreen(score: state.score),
              ),
              transition: getx.Transition.fadeIn,
            );
          });
        }
      },
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          return Stack(
            children: [
              CustomAppBar(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: SizeConfig.defaultSize! * 10),

                      if (state is QuizLoaded)
                        QuestionCard(
                          questionNumber:
                              "السؤال ${state.currentIndex + 1} من ${state.questions.length}",
                          questionText:
                              state.questions[state.currentIndex].questionBody,
                          quizTitle: 'اسئلة عامة',
                          timerSeconds: state.timerSeconds,
                          progress: state.progress,
                        )
                      else if (state is QuizFailed)
                        QuestionCard(
                          questionNumber: '',
                          questionText: state.errorMessage,
                          quizTitle: '',
                          timerSeconds: 0,
                          progress: 0,
                        ),

                      SizedBox(height: SizeConfig.defaultSize! * 3),

                      if (state is QuizLoaded)
                        OptionsList(
                          questionModel: state.questions[state.currentIndex],
                          selectedIndex: state.selectedIndex,
                          onSelect: (index) {
                            context.read<QuizCubit>().selectAnswer(index);
                          },
                        ),
                    ],
                  ),
                ),
              ),
              if (state is QuizLoaded)
                Positioned(
                  top: SizeConfig.defaultSize! * 10,
                  right: SizeConfig.defaultSize! * 5,
                  left: SizeConfig.defaultSize! * 5,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.cardDark,
                    backgroundColor: AppColors.primaryOrange.withOpacity(0.5),
                    value: state.currentIndex / state.questions.length,
                  ),
                ),
              Positioned(
                top: SizeConfig.defaultSize! * 2,
                left: SizeConfig.defaultSize! * 0.5,
                child: CustomIconButton(
                  onTap: () {
                    context.read<QuizCubit>().restartQuiz();
                  },
                ),
              ),
              Positioned(
                top: SizeConfig.defaultSize! * 2,
                right: SizeConfig.defaultSize! * 0.5,
                child:
                    (state is QuizLoaded)
                        ? ScoreCard(score: state.score)
                        : ScoreCard(),
              ),
            ],
          );
        },
      ),
    );
  }
}
