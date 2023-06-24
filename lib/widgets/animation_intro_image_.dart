import 'package:flutter/material.dart';

class AnimationIntroImage extends StatefulWidget {
  const AnimationIntroImage(
      {super.key,
      required this.image,
      required this.animation,
      required this.controller});

  final String image;
  final Animation<Alignment> animation;
  final AnimationController controller;

  @override
  State<AnimationIntroImage> createState() => _AnimationIntroImageState();
}

class _AnimationIntroImageState extends State<AnimationIntroImage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Align(
          alignment: widget.animation.value,
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
