import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_game/core/utils/size_config.dart';
import 'package:quiz_game/screens/quiz_type_screen.dart';
import 'package:quiz_game/widgets/custom_text_button.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    fadingAnimation = Tween<double>(
      begin: 0.2,
      end: 1,
    ).animate(animationController!);
    animationController?.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SizedBox(height: SizeConfig.defaultSize! * 25),
        Center(
          child: SizedBox(
            height: SizeConfig.defaultSize! * 30,
            child: Image.asset('assets/images/quiz-competition.png'),
          ),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 7),
        FadeTransition(
          opacity: fadingAnimation!,
          child: Text(
            'تعلم – تحدَّ – اربح.',
            style: TextStyle(
              fontSize: 42,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 7),
        CustomTextButton(text: 'إبدأ اللأن', onTap: () => goToNextView()),
      ],
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 5), () {
      Get.to(() => QuizTypeScreen(), transition: Transition.fade);
    });
  }
}
