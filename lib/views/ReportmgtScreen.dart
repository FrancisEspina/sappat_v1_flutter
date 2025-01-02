import 'package:flutter/material.dart';

class ReportmgtScreen extends StatefulWidget {
  const ReportmgtScreen({super.key});

  @override
  State<ReportmgtScreen> createState() => _ReportmgtScreenState();
}

class _ReportmgtScreenState extends State<ReportmgtScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
