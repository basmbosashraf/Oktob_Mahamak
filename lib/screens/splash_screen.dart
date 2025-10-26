import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goToHome();
  }
Future<void> _goToHome() async {
  await Future.delayed(const Duration(seconds: 2));


  if (mounted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFB6C1),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_alt, color: Colors.white, size: 90),
            SizedBox(height: 20),
            Text('اكتب مهامك 2026',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10),
            Text('نظم يومك بسهولة ',
                style: TextStyle(fontSize: 18, color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
