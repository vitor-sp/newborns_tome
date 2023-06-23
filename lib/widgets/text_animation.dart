import 'package:flutter/material.dart';
import 'package:newborns_tome/widgets/line_animation.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _txtController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _txtController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );

    Tween<double> tween = Tween<double>(begin: 0.0, end: 1.0);

    _slideAnimation = tween.animate(
      CurvedAnimation(
        parent: _txtController,
        curve: Curves.easeInOutCirc,
      ),
    );

    _txtController.forward();
  }

  @override
  void dispose() {
    _txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(_slideAnimation),
                    child: Text(
                      "THE",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: LineAnimation(
                  begin: 0,
                  end: size.width - size.width * 0.2,
                ),
              ),
              ClipRect(
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, -1.0),
                    end: Offset.zero,
                  ).animate(_slideAnimation),
                  child: Text(
                    "NEWBORN`S",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: LineAnimation(
                  begin: 0,
                  end: size.width - size.width * 0.2,
                ),
              ),
              Align(
                alignment: const Alignment(0.45, 0),
                child: ClipRect(
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, -1.0),
                      end: Offset.zero,
                    ).animate(_slideAnimation),
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
