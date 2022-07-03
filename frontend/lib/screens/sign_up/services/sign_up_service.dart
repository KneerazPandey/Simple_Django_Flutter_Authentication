import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:frontend/widgets/http_error_handling.dart';
import 'package:http/http.dart';

class SignUpService {
  void signUp({
    required String email,
    required String password,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    try {
      const String url = 'http://10.0.2.2:8000/api/register/';
      Uri uri = Uri.parse(url);
      User user = User(
        id: '',
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      Response response = await post(
        uri,
        body: user.toJson(),
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
            text: 'Account Created! Please login with the same credentials',
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
