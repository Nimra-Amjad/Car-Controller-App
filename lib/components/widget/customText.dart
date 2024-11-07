import 'package:car_controller_app/components/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxlines;
  final TextDecoration? underline;
  final double? letterSpacing;
  const CustomText({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxlines,
    this.underline,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaler: const TextScaler.linear(1.0),
      style: TextStyle(
          decoration: underline,
          fontWeight: fontWeight ?? FontWeight.normal,
          overflow: overflow,
          letterSpacing: letterSpacing ?? -0.48,
          color: textColor ?? AppColors.primaryWhiteColor,
          fontSize: fontSize ?? 20),
    );
  }
}
