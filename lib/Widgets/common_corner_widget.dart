
import 'package:flutter/material.dart';
import 'package:flutter_test_task/Screens/home_screen.dart';

class CommonCornerWidget extends StatelessWidget {
  final double screenHeight;
  final Alignment alignment;
  final Widget child;
  final BorderRadius borderRadius;
  
  const CommonCornerWidget({
    super.key, required this.alignment, required this.child, required this.borderRadius, required this.screenHeight, 
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
      height: screenHeight ,
      width: screenWidth,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius, 
        boxShadow: [BoxShadow(
          color: Colors.grey, 
          spreadRadius: 3, 
          blurRadius: 15
        )]
      ),
      child: child),
    );
  }
}