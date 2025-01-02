import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sappat_v1_flutter/views/LoginScreen.dart';
import 'package:sappat_v1_flutter/views/DashboardScreen.dart';
import 'package:sappat_v1_flutter/views/RootScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Simulating a delay for the splash screen
    var seconds = 1;
    await Future.delayed(Duration(seconds: seconds));

    // Check if the token exists in storage
    final storage = GetStorage();
    bool hasToken = storage.read('token') != null;

    // Navigate to the appropriate screen
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue, // Splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logo_dev,
                size: 100, color: Colors.white), // Your logo or icon
            SizedBox(height: 20),
            Text(
              'Sappat',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
