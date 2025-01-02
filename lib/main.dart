import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sappat_v1_flutter/constants/constants.dart';
import 'package:sappat_v1_flutter/views/LoginScreen.dart';
import 'package:sappat_v1_flutter/views/SplashScreen.dart';
// Import the SplashScreen

void main() async {
  // Ensure GetStorage is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get myTheme => ThemeData(
      chipTheme: ChipThemeData(
        backgroundColor: Colors.grey[300]!,
        disabledColor: Colors.grey[200]!,
        selectedColor: Colors.blue[300]!,
        secondarySelectedColor: Colors.blueAccent,
        side: BorderSide.none, // This removes the outline
        padding: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        secondaryLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        brightness: Brightness.light, // Adjusts for light or dark mode
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: Colors.blue[50],

        color: Colors.blue, // Default color for CircularProgressIndicator
      ),
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      textTheme: GoogleFonts.poppinsTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Default background color
          backgroundColor: Colors.blue, // Default background color
        ),
      ),
      appBarTheme: const AppBarTheme());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const SplashScreen(),
    );
  }
}
