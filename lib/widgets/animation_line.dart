import 'package:flutter/material.dart';
import 'package:newborns_tome/utils/animation_manager.dart';
import 'package:provider/provider.dart';

class AnimationLine extends StatelessWidget {
  AnimationLine({
    super.key,
    required this.widthLine,
  });

  double widthLine = 0;

  @override
  Widget build(BuildContext context) {
    final animationManager =
        Provider.of<AnimationManager>(context, listen: false);

    return AnimatedBuilder(
      animation: animationManager.loginAnimationsControllers['login_line']!,
      builder: (context, child) {
        return Container(
          width: animationManager.animations['login_line']!.value + widthLine,
          height: 2,
          color: Theme.of(context).primaryColor,
        );
      },
    );
  }
}
