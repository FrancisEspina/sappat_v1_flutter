import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = true;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : hasError
                ? const Center(child: Text('Failed to load data'))
                : const Center(child: Text('Mock Data Available')));
  }
}
