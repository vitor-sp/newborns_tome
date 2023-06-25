import 'package:flutter/material.dart';
import 'package:newborns_tome/widgets/hover_text.dart';

class AnimatedLoginPassword extends StatefulWidget {
  const AnimatedLoginPassword({super.key});

  @override
  State<AnimatedLoginPassword> createState() => _AnimatedLoginPasswordState();
}

class _AnimatedLoginPasswordState extends State<AnimatedLoginPassword>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

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
        vsync: this);

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
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: SizedBox(
          height: 250,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(context, 'Username'),
              const SizedBox(
                height: 20,
              ),
              _buildTextField(context, 'Password'),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 300,
                ),
                child: const HoverText(
                  text: "New? Register now!",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(BuildContext context, String label) {
  return SizedBox(
    height: 35,
    child: TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide.none,
        ),
        labelText: label,
      ),
      // Add TextEditingController to manage the entered value
      controller: TextEditingController(),
      // Add form validation
      // validator: (value) {
      //   // Perform validation and return error message if invalid
      //   return 'Invalid $label';
      // },
      // Enable/disable auto-focus, auto-capitalization, etc., based on requirements
    ),
  );
}
