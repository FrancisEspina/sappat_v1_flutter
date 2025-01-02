import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sappat_v1_flutter/constants/constants.dart';

// Create an instance of FlutterSecureStorage
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future searchBusiness(searchString) async {
  // Retrieve user_id and token from secure storage
  var token = await secureStorage.read(key: 'token');

  try {
    var response = await http.get(
      Uri.parse('${baseURL}home/search?string=$searchString&token=$token'),
      headers: {
        'Content-Type': 'application/json', // Expect JSON response
      },
    );
    final responseData = jsonDecode(response.body);
    return responseData;
  } catch (e) {
    return e;
  }
}
