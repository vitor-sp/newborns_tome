import 'package:flutter/material.dart';

class LineTextAnimation extends StatefulWidget {
  const LineTextAnimation({super.key});

  @override
  State<LineTextAnimation> createState() => _LineTextAnimationState();
}

class _LineTextAnimationState extends State<LineTextAnimation>
    with SingleTickerProviderStateMixin {
  late final _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    _animation = _controller.drive(
      CurveTween(
        curve: Curves.ease,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "THE",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Divider(),
          Text(
            "NEWBORN`S",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Divider(),
          Text(
            "TOME",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
