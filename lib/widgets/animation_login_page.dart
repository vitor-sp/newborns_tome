import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newborns_tome/widgets/animation_background_.dart';
import 'package:newborns_tome/widgets/animation_intro_image_.dart';
import 'package:newborns_tome/widgets/animation_line.dart';
import 'package:newborns_tome/widgets/animation_text.dart';

class AnimationLoginPage extends StatefulWidget {
  const AnimationLoginPage({super.key});

  @override
  State<AnimationLoginPage> createState() => _AnimationLoginPageState();
}

class _AnimationLoginPageState extends State<AnimationLoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _animationBackgrond;

  late Animation<Alignment> _animationImage;
  late Animation<Offset> _animationTextBottom;
  late Animation<Offset> _animationTextTop;
  late Animation<double> _animationLine;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _animationBackgrond = Tween<Offset>(
      begin: const Offset(0.1, 0),
      end: const Offset(0, 0.1),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationImage = Tween<Alignment>(
      begin: const Alignment(0.5, 0),
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.8,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationTextBottom = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationTextTop = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationLine = Tween<double>(
      begin: 0,
      end: 1000,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.8,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          final leftPadding = size.width * 0.025;
          final topPadding = size.height * 0.075;
          return Stack(
            children: [
              const AnimationBackground(
                image: "assets/clouds.jpg",
              ),
              AnimationIntroImage(
                image: "assets/maria_jesus.png",
                controller: _controller,
                animation: _animationImage,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  leftPadding,
                  topPadding,
                  leftPadding,
                  topPadding,
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      child: AnimationText(
                        controller: _controller,
                        animation: _animationTextBottom,
                        txt: "THE",
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AnimationLine(
                        animation: _animationLine,
                        controller: _controller,
                      ),
                    ),
                    AnimationText(
                      controller: _controller,
                      animation: _animationTextBottom,
                      txt: "NEWSBORN`S",
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AnimationLine(
                        animation: _animationLine,
                        controller: _controller,
                      ),
                    ),
                    AnimationText(
                      controller: _controller,
                      animation: _animationTextBottom,
                      txt: "TOME",
                    ),
                  ],
                ),
              ),
              Center(
                child: ClipPath(
                  clipper: InvertedRect(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 5.0,
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class InvertedRect extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    return Path()
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..addRect(Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width * 0.95,
          height: size.height * 0.85))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
