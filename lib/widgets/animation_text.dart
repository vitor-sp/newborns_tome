import 'package:flutter/material.dart';
import 'package:newborns_tome/utils/animation_manager.dart';
import 'package:newborns_tome/widgets/animation_line.dart';
import 'package:provider/provider.dart';

class AnimationText extends StatelessWidget {
  const AnimationText({super.key});

  @override
  Widget build(BuildContext context) {
    final animationManager =
        Provider.of<AnimationManager>(context, listen: false);

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const Alignment(-0.5, 0),
                child: ClipRect(
                  child: SlideTransition(
                    position: animationManager.animations['login_text_bottom']!
                        as Animation<Offset>,
                    child: Text(
                      "THE",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AnimationLine(
                  widthLine: size.width - size.width * 0.2,
                ),
              ),
              ClipRect(
                child: SlideTransition(
                  position: animationManager.animations['login_text_top']!
                      as Animation<Offset>,
                  child: Text(
                    "NEWBORN`S",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AnimationLine(
                  widthLine: size.width - size.width * 0.2,
                ),
              ),
              Align(
                alignment: const Alignment(0.45, 0),
                child: ClipRect(
                  child: SlideTransition(
                    position: animationManager.animations['login_text_top']!
                        as Animation<Offset>,
                    child: Text(
                      "TOME",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
