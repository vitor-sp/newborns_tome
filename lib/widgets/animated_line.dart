import 'package:flutter/material.dart';

class AnimatedLine extends StatefulWidget {
  AnimatedLine({
    super.key,
    required this.controller,
    required this.middleScreenSize,
  });

  final AnimationController controller;
  final double middleScreenSize;

  double widthLine = 0;

  @override
  State<AnimatedLine> createState() => _AnimatedLineState();
}

class _AnimatedLineState extends State<AnimatedLine>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(
      begin: 0,
      end: widget.middleScreenSize + 300,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.0,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        dispose();
      }
    });
  }

  @override
  void dispose() {
    widget.controller.removeStatusListener((status) {});
    print("animatedLine disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Container(
          width: _animation.value,
          height: 2,
          color: Theme.of(context).primaryColor,
        );
      },
    );
  }
}
