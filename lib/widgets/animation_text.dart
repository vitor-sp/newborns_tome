import 'package:flutter/material.dart';

class AnimationText extends StatefulWidget {
  const AnimationText(
      {super.key,
      required this.animation,
      required this.controller,
      required this.txt});

  final Animation<Offset> animation;
  final AnimationController controller;
  final String txt;

  @override
  State<AnimationText> createState() => _AnimationTextState();
}

class _AnimationTextState extends State<AnimationText>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: ClipRect(
            child: SlideTransition(
              position: widget.animation,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: true,
                    applyHeightToLastDescent: true,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  text: TextSpan(
                    style: Theme.of(context).textTheme.displayLarge,
                    children: [
                      TextSpan(
                        text: widget.txt,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
