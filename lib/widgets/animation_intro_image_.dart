import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimationIntroImage extends StatefulWidget {
  const AnimationIntroImage({super.key, required this.image});

  final String image;

  @override
  State<AnimationIntroImage> createState() => _AnimationIntroImageState();
}

class _AnimationIntroImageState extends State<AnimationIntroImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    _animation = Tween<Alignment>(
      begin: const Alignment(0.7, 0),
      end: Alignment.centerRight,
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
