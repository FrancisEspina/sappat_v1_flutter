import 'package:flutter/material.dart';
import 'package:sappat_v1_flutter/views/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sappat',
      home: LoginPage(),
    );
  }
}
