import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

const blue = Color.fromARGB(255, 30, 49, 157);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => loginpageui(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Center(
        child: Image(
          image: AssetImage("res/bdm.jpg"),
          width: 150,
        ),
      ),
    );
  }
}