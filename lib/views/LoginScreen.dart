// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sappat_v1_flutter/constants/constants.dart';
import 'package:sappat_v1_flutter/controllers/authentication.dart';
import 'package:sappat_v1_flutter/views/DashboardScreen.dart';
import 'package:sappat_v1_flutter/views/widgets/InputWidgets.dart';
import 'package:sappat_v1_flutter/views/widgets/snackBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Input Validation: Check if email or password is empty
    if (email.isEmpty || password.isEmpty) {
      showCustomSnackBar(
        message: 'Email and Password field should not be empty!',
        title: 'Login Failed', // Custom title for success
        backgroundColor: Colors.red, // Custom color for success
      );
    } else {
      var user = await _authenticationController.login(
          email: email, password: password);
      if (user) {
        showCustomSnackBar(
          message: 'Login successful!',
          title: 'Success', // Custom title for success
          backgroundColor: Colors.blue, // Custom color for success
        );
      } else {
        showCustomSnackBar(
          message: 'Incorrect Email or Password!',
          title: 'Login Failed', // Custom title for success
          backgroundColor: Colors.red, // Custom color for success
        );
      }
    }
  }

  // Function to show success message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(horizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: defaultHeight + 30),
                Padding(
                    padding: const EdgeInsets.all(40),
                    child: Image.asset(
                      '${assets}sappat_logo.png',
                      height: 100,
                      fit: BoxFit.fitWidth,
                      color: Colors.blue, // Tint color
                      colorBlendMode: BlendMode.srcATop, // Blend mode
                    )),
                InputWidget(
                    hintText: 'Email',
                    controller: _emailController,
                    obscureText: false),
                const SizedBox(height: 24),
                InputWidget(
                    hintText: 'Password',
                    controller: _passwordController,
                    obscureText: true),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity, // Full width
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Sign In'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
