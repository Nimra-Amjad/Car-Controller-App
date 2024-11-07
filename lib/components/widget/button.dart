import 'package:car_controller_app/components/core/app_colors.dart';
import 'package:car_controller_app/components/widget/customText.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  const AppButton({super.key, required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue.shade100),
        padding: const EdgeInsets.all(15),
        child: CustomText(
          text: btnText,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.0,
          textColor: AppColors.primaryBlackColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
