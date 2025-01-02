import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

void showCustomSnackBar({
  required String message,
  String title = 'Notification', // Default title
  Color? backgroundColor, // Optional parameter for background color
  Color textColor = Colors.white, // Default text color
  SnackPosition snackPosition = SnackPosition.TOP, // Default position
}) {
  bool isSuccess = title == 'Success'; // Change this based on the desired title
  IconData icon = isSuccess
      ? Icons.check_circle
      : Icons.cancel; // Checkmark for success, X for failure
  Get.snackbar(
    title,
    message,
    dismissDirection: DismissDirection.horizontal,
    backgroundColor:
        backgroundColor ?? Colors.blue, // Default to blue if not provided
    colorText: Colors.white, // Set the default text color if needed
    snackPosition: snackPosition,
    icon: Icon(
      icon,
      color: Colors.white,
    ),
    titleText: Text(
      title,
      style: const TextStyle(
        fontSize: 14, // Set your desired font size
        fontWeight: FontWeight.bold, // Set your desired font weight
        color: Colors.white, // Change title text color if needed
      ),
    ),
    messageText: Text(
      message,
      style: const TextStyle(
        fontSize: 12, // Set your desired font size
        color: Colors.white, // Change message text color if needed
      ),
    ),
  );
}
