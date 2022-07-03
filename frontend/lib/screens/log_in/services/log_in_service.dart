import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:frontend/widgets/http_error_handling.dart';
import 'package:http/http.dart';

class LogInService {
  void logIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      const String url = 'http://10.0.2.2:8000/api/login/';
      Uri uri = Uri.parse(url);
      Response response = await post(
        uri,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      HttpErrorHandling.handleHttpError(
        response: response,
        context: context,
        onSuccess: () {
          CustomSnackBar.showSnackBar(
            context: context,
            text: 'Login Sucessfull',
          );
        },
      );
    } catch (error) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: error.toString(),
      );
    }
  }
}
