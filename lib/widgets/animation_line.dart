import 'package:flutter/material.dart';

class AnimationLine extends StatefulWidget {
  AnimationLine({
    super.key,
    required this.widthLine,
  });

  double widthLine = 0;

  @override
  State<AnimationLine> createState() => _AnimationLineState();
}

class _AnimationLineState extends State<AnimationLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.widthLine,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
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
