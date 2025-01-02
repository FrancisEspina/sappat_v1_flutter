import 'package:flutter/material.dart';

class VcmgtScreen extends StatefulWidget {
  const VcmgtScreen({super.key});

  @override
  State<VcmgtScreen> createState() => _VcmgtScreenState();
}

class _VcmgtScreenState extends State<VcmgtScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
