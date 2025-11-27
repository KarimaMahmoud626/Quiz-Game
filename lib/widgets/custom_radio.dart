import 'package:flutter/material.dart';
import 'package:quiz_game/core/utils/size_config.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.icon,
    this.onTap,
    this.isSelected = false,
  });

  final IconData? icon;
  final void Function()? onTap;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.defaultSize! * 3,
        height: SizeConfig.defaultSize! * 3,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Center(
          child:
              isSelected!
                  ? Center(
                    child: Icon(icon, color: Color(0xFF649E0D), size: 22),
                  )
                  : Container(
                    width: SizeConfig.defaultSize! * 1.5,
                    height: SizeConfig.defaultSize! * 1.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    // child: Center(
                    //   child: Icon(icon, color: Color(0xFF649E0D), size: 22),
                    // ),
                  ),
        ),
      ),
    );
  }
}
