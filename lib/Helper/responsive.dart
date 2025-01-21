import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget desktopBody;
  
  final Widget mobileBody;
  const ResponsiveLayout({
    super.key,
    required this.desktopBody,
    required this.mobileBody,
  });

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth < 600) {
          // print(constrains.maxWidth);
          return widget.mobileBody;
        }  else {
          return widget.desktopBody;
        }
      },
    );
  }
}