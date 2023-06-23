import 'package:flutter/material.dart';

class IntroImageAnimation extends StatefulWidget {
  const IntroImageAnimation({super.key, required this.image});

  final String image;

  @override
  State<IntroImageAnimation> createState() => _IntroImageAnimationState();
}

class _IntroImageAnimationState extends State<IntroImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _widthAnimation = Tween<double>(
      begin: 500,
      end: 1100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.slowMiddle));

    _alignmentAnimation = Tween<Alignment>(
      begin: const Alignment(0, 0.5),
      end: const Alignment(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn,
      ),
    )..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0),
      child: SizedBox(
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.amber,
        //   ),
        // ),
        width: _widthAnimation.value,
        child: Image.asset(
          alignment: Alignment.bottomCenter,
          widget.image,
        ),
      ),
    );
    // return Align(
    //   alignment: const Alignment(0.5, 0.5),
    //   child: Container(
    //     height: 50,
    //     width: 50,
    //     color: Colors.red,
    //   ),
    // );
  }
}
