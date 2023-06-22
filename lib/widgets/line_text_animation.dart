import 'package:flutter/material.dart';

class LineTextAnimation extends StatefulWidget {
  const LineTextAnimation({super.key});

  @override
  State<LineTextAnimation> createState() => _LineTextAnimationState();
}

class _LineTextAnimationState extends State<LineTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _txtController;
  late Animation<double> _animation;

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

    _animation = tween.animate(
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
    List<String> title = [];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRect(
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(_animation),
              child: Text(
                "THE",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
            height: 1,
          ),
          ClipRect(
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -1.0),
                end: Offset.zero,
              ).animate(_animation),
              child: Text(
                "NEWBORN`S",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
            height: 1,
          ),
          ClipRect(
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -1.0),
                end: Offset.zero,
              ).animate(_animation),
              child: Text(
                "TOME",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
