import 'package:flutter/material.dart';

class AnimationLine extends StatefulWidget {
  AnimationLine({
    super.key,
    required this.animation,
    required this.controller,
  });

  final Animation<double> animation;
  final AnimationController controller;

  double widthLine = 0;

  @override
  State<AnimationLine> createState() => _AnimationLineState();
}

class _AnimationLineState extends State<AnimationLine>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Container(
          width: widget.animation.value,
          height: 2,
          color: Theme.of(context).primaryColor,
        );
      },
    );
  }
}
