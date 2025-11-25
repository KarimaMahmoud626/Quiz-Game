import 'package:flutter/material.dart';
import 'package:quiz_game/core/utils/size_config.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: SizeConfig.defaultSize! * 20,
        width: SizeConfig.defaultSize! * 40,
        child: Card(
          color: Color(0xFFA2E1DB),
          elevation: 4,
          child: Center(
            child: Text(
              'السؤال الأول',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
