import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MouseRegionWidget extends StatefulWidget {
   bool isHovering;
   final Widget child;
  final Function(PointerEnterEvent)? onEnter;
  final Function(PointerExitEvent)? onExit;
   MouseRegionWidget({super.key, this.isHovering = false, required this.child, this.onEnter, this.onExit});

  @override
  State<MouseRegionWidget> createState() => _MouseRegionWidgetState();
}

class _MouseRegionWidgetState extends State<MouseRegionWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: widget.onEnter,
      onExit: widget.onExit,
      child: widget.child);
  }
}