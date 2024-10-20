import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sappat_v1_flutter/views/SplashScreen.dart';
// Import the SplashScreen

void main() async {
  // Ensure GetStorage is initialized
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Set SplashScreen as the initial route
    );
  }
}
