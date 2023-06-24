import 'package:flutter/material.dart';
import 'package:newborns_tome/utils/animation_manager.dart';
import 'package:newborns_tome/widgets/animation_login_page.dart';

class LoginPage extends StatefulWidget {
  final AnimationManager animationManager = AnimationManager();

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool showTextFields = false;
  @override
  Widget build(BuildContext context) {
    final List<String> text = ["IDEAL", "GREEK", "BEAUTY"];
    return const Scaffold(
      body: Stack(
        children: [
          AnimationLoginPage(),
        ],
      ),
    );
  }
}
