// Define a map for different environments
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ip = '192.168.137.1';
Map<String, String> url = {
  'emulator': 'http://10.0.2.2:8000/',
  'localhost': 'http://localhost:8000/',
  'android': 'http://$ip:8000/', // Use string interpolation here
  'api': 'https://sappat.uptacloban.edu.ph/sappat/'
};

String? assets = 'assets/images/';
// Select the base URL from the map
String? baseURL = url['api']; // or 'localhost', or 'android'
const double verticalPadding = 35;
const double horizontalPadding = 25;
const double defaultHeight = 20;
const double defaultRadius = 30;

// You can set baseURL based on the environment you're targeting
// Example: String baseURL = url['localhost'];
const h1 =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.blue);
const h2 = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
const pageTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.w900);
const h3 = TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
const h4 = TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
const h5 = TextStyle(fontSize: 10);
const padding = EdgeInsets.all(20);

const Color defaultColor = Color(0xFFF8F8F8);
const green = Color.fromARGB(255, 40, 185, 3);
