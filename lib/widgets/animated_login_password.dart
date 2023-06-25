import 'package:flutter/material.dart';

import 'custom_text_field.dart';
import 'hover_text.dart';

class AnimatedLoginPassword extends StatefulWidget {
  const AnimatedLoginPassword({super.key});

  @override
  State<AnimatedLoginPassword> createState() => _AnimatedLoginPasswordState();
}

class _AnimatedLoginPasswordState extends State<AnimatedLoginPassword>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    const int duration = 1;
    const double begin = 0;
    const double end = 1;
    _controller = AnimationController(
      duration: const Duration(
        seconds: duration,
      ),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
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
    return RepaintBoundary(
      child: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextField(
                  label: "Username",
                ),
                const SizedBox(height: 20),
                const CustomTextField(
                  label: "Password",
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 35,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const HoverText(
                  text: "New? Register now!",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
