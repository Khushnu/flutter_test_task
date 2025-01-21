import 'package:flutter/material.dart';
import 'package:flutter_test_task/Helper/responsive.dart';
import 'package:flutter_test_task/Screens/desktop_screen.dart';
import 'package:flutter_test_task/Screens/mobile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

double screenHeight = 0;
double screenWidth = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(desktopBody: DesktopScreen(), mobileBody: MobileScreen());
  }
}