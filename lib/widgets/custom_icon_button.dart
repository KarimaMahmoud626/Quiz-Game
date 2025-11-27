import 'package:flutter/material.dart';
import 'package:quiz_game/core/app_colors.dart';
import 'package:quiz_game/core/utils/size_config.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: SizeConfig.defaultSize! * 5,
          width: SizeConfig.defaultSize! * 5,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryOrange,
          ),
          child: Icon(Icons.restart_alt_outlined, color: Colors.grey),
        ),
      ),
    );
  }
}
