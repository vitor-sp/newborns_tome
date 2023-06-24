import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimationManager extends ChangeNotifier implements TickerProvider {
  late Map<String, AnimationController> _animationsControllers;
  late Map<String, Animation<dynamic>> animations;
  bool showTextFields = false;
  Timer? timer;

  AnimationManager() {
    _animationsControllers = {
      'login_background': AnimationController(
        duration: const Duration(
          seconds: 10,
        ),
        vsync: this,
      ),
      'login_line': AnimationController(
        duration: const Duration(
          seconds: 1,
        ),
        vsync: this,
      ),
      'login_text': AnimationController(
        duration: const Duration(
          seconds: 2,
        ),
        vsync: this,
      ),
      'login_image': AnimationController(
        duration: const Duration(
          seconds: 1,
        ),
        vsync: this,
      ),
    };

    animations = {
      'login_background': Tween<Offset>(
        begin: const Offset(0.1, 0),
        end: const Offset(0, 0.1),
      ).animate(
        CurvedAnimation(
          parent: _animationsControllers['login_background']!,
          curve: Curves.easeInOut,
        ),
      ),
      'login_line': Tween<double>(
        begin: 0,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: _animationsControllers['login_line']!,
          curve: Curves.easeInOut,
        ),
      ),
      'login_text_bottom': Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _animationsControllers['login_text']!,
        curve: Curves.easeInOut,
      )),
      'login_text_top': Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _animationsControllers['login_text']!,
        curve: Curves.easeInOut,
      )),
      'login_image': Tween<Alignment>(
        begin: const Alignment(0.7, 0),
        end: Alignment.centerRight,
      ).animate(
        CurvedAnimation(
          parent: _animationsControllers['login_image']!,
          curve: Curves.easeInOut,
        ),
      ),
    };
  }

  void startLoginAnimaitons() {
    Future.wait(_animationsControllers.values
        .map((controller) => controller.forward()));

    _animationsControllers['login_background']!.repeat(reverse: true);

    // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   final animationValue = animations['login_line']!.value;
    //   print('login_line value: $animationValue');
    // });
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }

  get loginAnimationsControllers => _animationsControllers;
}
