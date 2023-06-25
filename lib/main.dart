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
    final theme = NewbornsTome.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: true,
      showSemanticsDebugger: false,
      title: 'Flutter Demo',
      theme: theme,
      home: const LoginPage(),
    );
  }
}
