import 'package:flutter/material.dart';
import 'package:newborns_tome/screens/login_page.dart';
import 'package:newborns_tome/utils/newborns_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = NewbornsTome.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: Container(
        color: Colors.black45,
        child: const LoginPage(),
      ),
    );
  }
}
