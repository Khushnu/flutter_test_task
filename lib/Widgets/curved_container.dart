import 'package:flutter/material.dart';
import 'package:flutter_test_task/Helper/colors.dart';

class CurvedContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final bool isTopCurved;

  const CurvedContainer({
    super.key,
    required this.child,
    required this.height,
    this.isTopCurved = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipPath(
        clipper: CurvedClipper(isTopCurved: isTopCurved),
        child: Container(
          width: double.infinity,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                bgColor1, // Light blue background
                bgColor2,
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  final bool isTopCurved;

  CurvedClipper({required this.isTopCurved});

  @override
  Path getClip(Size size) {
    var path = Path();

    // Top wavy line
    if (isTopCurved) {
      path.lineTo(0, size.height * 0.25);
      var firstControlPoint = Offset(size.width * 0.25, size.height * 0.15);
      var firstEndPoint = Offset(size.width * 0.5, size.height * 0.25);
      path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy,
      );

      var secondControlPoint = Offset(size.width * 0.75, size.height * 0.35);
      var secondEndPoint = Offset(size.width, size.height * 0.25);
      path.quadraticBezierTo(
        secondControlPoint.dx,
        secondControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy,
      );
    } else {
      path.lineTo(0, 0);
      path.lineTo(size.width, 0);
    }

    // Bottom wavy line
    path.lineTo(size.width, size.height * 0.75);
    var thirdControlPoint = Offset(size.width * 0.75, size.height * 0.85);
    var thirdEndPoint = Offset(size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(
      thirdControlPoint.dx,
      thirdControlPoint.dy,
      thirdEndPoint.dx,
      thirdEndPoint.dy,
    );

    var fourthControlPoint = Offset(size.width * 0.25, size.height * 0.65);
    var fourthEndPoint = Offset(0, size.height * 0.75);
    path.quadraticBezierTo(
      fourthControlPoint.dx,
      fourthControlPoint.dy,
      fourthEndPoint.dx,
      fourthEndPoint.dy,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
