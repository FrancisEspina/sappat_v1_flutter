import 'dart:convert';
import 'package:sappat_v1_flutter/constants/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sappat_v1_flutter/views/LoginScreen.dart';
import 'package:sappat_v1_flutter/views/RootScreen.dart';
import 'package:sappat_v1_flutter/views/widgets/snackBar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sappat_v1_flutter/views/DashboardScreen.dart';

class AuthenticationController extends GetxController {
  final Map<String, dynamic> user = {
    'user_id': '',
    'token': '',
    'user': '',
    'user_type': '',
    'permissions': []
  };

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<bool> login({required String email, required String password}) async {
    try {
      var data = {
        'email': email,
        'password': password,
      };

      // Send a POST request with proper headers and JSON encoded body
      var response = await http.post(
        Uri.parse('${baseURL}login'),
        headers: {
          'Accept': 'application/json',
        },
        body: data, // Encoding data as JSON
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Check if the token exists in the response
        if (responseData.containsKey('token')) {
          for (var key in user.keys) {
            user[key] = responseData[key];
          }
          await secureStorage.write(key: 'token', value: user['token']);
          await secureStorage.write(
              key: 'user_id', value: user['user_id'].toString());
          await secureStorage.write(
              key: 'user_type', value: user['user_type'].toString());

          Get.offAll(() => const RootScreen());
          return true;
        } else {
          print('Token not found in response');
          return false;
        }
      } else {
        print('Login failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred during login: $e');
      return false;
    }
  }

  // Optionally, a method to retrieve the token from storage
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  // Optionally, a method to clear the token when logging out
  Future<void> logout() async {
    print(await secureStorage.read(key: 'token'));
    await secureStorage.delete(key: 'token');
    Get.offAll(() => const LoginScreen());
  }
}
