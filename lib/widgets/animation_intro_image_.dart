import 'package:flutter/material.dart';
import 'package:newborns_tome/utils/animation_manager.dart';
import 'package:provider/provider.dart';

class AnimationIntroImage extends StatelessWidget {
  const AnimationIntroImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final animationManager =
        Provider.of<AnimationManager>(context, listen: false);

    return AnimatedBuilder(
      animation: animationManager.loginAnimationsControllers['login_image']!,
      builder: (context, child) {
        return Align(
          alignment: animationManager.animations['login_image']!.value,
          child: SizedBox(
            width: 700,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              isAntiAlias: true,
            ),
          ),
        );
      },
    );
  }
}
