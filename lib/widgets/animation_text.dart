import 'package:flutter/material.dart';
import 'package:newborns_tome/widgets/animation_line.dart';
import 'package:provider/provider.dart';

class AnimationText extends StatefulWidget {
  const AnimationText({super.key});

  @override
  State<AnimationText> createState() => _AnimationTextState();
}

class _AnimationTextState extends State<AnimationText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationBottom;
  late Animation<Offset> _animationTop;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    _animationBottom = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _animationTop = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
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
                    position: _animationBottom,
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
                  position: _animationTop,
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
                    position: _animationTop,
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
