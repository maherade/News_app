import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/view/home/home_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splash-view';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Image.asset('assets/images/logo.png'),
            ),
          )
        ],
      ),
    );
  }
}
