import 'package:flutter/material.dart';
import 'package:newborns_tome/screens/login_page.dart';
import 'package:newborns_tome/utils/animation_manager.dart';
import 'package:newborns_tome/utils/newborns_theme.dart';
import 'package:provider/provider.dart';

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
      showPerformanceOverlay: false,
      title: 'Flutter Demo',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AnimationManager(),
          )
        ],
        child: LoginPage(),
      ),
    );
  }
}
