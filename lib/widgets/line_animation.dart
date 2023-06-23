import 'package:flutter/material.dart';

class LineAnimation extends StatefulWidget {
  LineAnimation({super.key, required this.end, required this.begin});

  double end;
  double begin;

  @override
  _LineAnimationState createState() => _LineAnimationState();
}

class _LineAnimationState extends State<LineAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 500,
      ),
      vsync: this,
    );

    _animation =
        Tween<double>(begin: widget.begin, end: widget.end).animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _controller.duration!,
      width: _animation.value,
      height: 2,
      color: Theme.of(context).primaryColor,
    );
  }
}
