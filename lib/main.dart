import 'package:flutter/material.dart';
import 'package:seequl/utils/theme.dart';

import 'view/screen/splash/splash_screen.dart';

void main() {
  runApp(const Seequl());
}

class Seequl extends StatelessWidget {
  const Seequl({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      
      darkTheme: customTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
