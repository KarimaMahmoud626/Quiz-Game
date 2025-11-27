import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_game/screens/quiz_screen.dart';
import 'package:quiz_game/widgets/quiz_type_card.dart';

class QuizTypeBody extends StatelessWidget {
  QuizTypeBody({super.key});

  final List<Color> colors = [
    Color(0xFF95AB3C),
    Color(0xFF305450),
    Color(0xFF4C4C4C),
    Color(0xFF91B797),
  ];

  final List<String> quizTypes = ['عامة', 'رياضة', 'فيزياء', 'كيمياء'];
  final List<IconData> icons = [
    Icons.category,
    Icons.sports,
    Icons.bolt,
    Icons.bubble_chart,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 1,
            ),
            itemCount: quizTypes.length,
            itemBuilder: (context, index) {
              return QuizTypeCard(
                onTap: () {
                  Get.to(
                    () => QuizScreen(quizType: quizTypes[index]),
                    transition: Transition.fade,
                  );
                },
                cardColor: colors[index],
                icon: icons[index],
                quizType: quizTypes[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
