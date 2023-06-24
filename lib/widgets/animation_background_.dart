import 'package:flutter/material.dart';
import 'package:newborns_tome/utils/animation_manager.dart';
import 'package:provider/provider.dart';

class AnimationBackground extends StatelessWidget {
  const AnimationBackground({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final animationManager =
        Provider.of<AnimationManager>(context, listen: false);

    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

        return ClipRect(
          child: SizedBox(
            width: availableWidth,
            height: availableHeight,
            child: SlideTransition(
              position: animationManager.animations['login_background']!
                  as Animation<Offset>,
              child: Transform.scale(
                scale: 1.2,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
