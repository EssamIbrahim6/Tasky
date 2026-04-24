import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_colors.dart';

class MainButtomWidget extends StatelessWidget {
  const MainButtomWidget({super.key
    , this.onPressed,
     this.text
  });
  final VoidCallback? onPressed;
  final String? text;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.mainColor,
      minWidth: double.infinity,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        text ?? '',
        style: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}