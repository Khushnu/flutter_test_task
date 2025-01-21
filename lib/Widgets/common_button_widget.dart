import 'package:flutter/material.dart';
import 'package:flutter_test_task/Helper/colors.dart';
import 'package:flutter_test_task/Screens/home_screen.dart';

class CommonButtonWidget extends StatelessWidget {
  final Widget child;
  final double? screenWidth;
  const CommonButtonWidget({
    super.key, required this.child,
    this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 40,
        width: screenWidth ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
          btnColor2,
          btnColor1 
        ]), 
        
        ),
        child: Center(
          child: child,
        ),
      
    );
  }
}