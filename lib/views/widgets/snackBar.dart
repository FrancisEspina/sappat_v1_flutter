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
  Get.snackbar(
    dismissDirection: DismissDirection.horizontal,
    title,
    message,
    backgroundColor:
        backgroundColor ?? Colors.blue, // Default to blue if not provided
    colorText: textColor,
    snackPosition: snackPosition,
  );
}
