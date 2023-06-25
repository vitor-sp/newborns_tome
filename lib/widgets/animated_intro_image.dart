import 'package:flutter/material.dart';

class AnimatedIntroImage extends StatefulWidget {
  const AnimatedIntroImage(
      {super.key,
      required this.image,
      required this.animation,
      required this.controller});

  final String image;
  final Animation<Alignment> animation;
  final AnimationController controller;

  @override
  State<AnimatedIntroImage> createState() => _AnimatedIntroImageState();
}

class _AnimatedIntroImageState extends State<AnimatedIntroImage>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> _animation;
  @override
  void initState() {
    super.initState();

    _animation = Tween<Alignment>(
      begin: const Alignment(0.5, 0),
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.0,
          0.8,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Align(
          alignment: _animation.value,
          child: SizedBox(
            width: 700,
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
              isAntiAlias: true,
            ),
          ),
        );
      },
    );
  }
}
