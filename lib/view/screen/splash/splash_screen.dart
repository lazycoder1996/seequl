import 'package:flutter/material.dart';
import 'package:seequl/utils/fonts.dart';
import 'package:seequl/utils/navigation.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      replaceScreen(context, const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Seequl',
        style: Fonts.robotoBlack.copyWith(fontSize: 45),
      )),
    );
  }
}
