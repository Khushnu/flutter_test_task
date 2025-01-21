
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize; 
  final Color? textColor; 
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const CustomTextWidget({
    super.key, required this.text, this.fontSize, this.textColor, this.fontWeight, this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign ?? TextAlign.left, style: TextStyle(fontSize: fontSize ?? 20, color: textColor ?? Colors.white, fontWeight: fontWeight ?? FontWeight.normal ),);
  }
}