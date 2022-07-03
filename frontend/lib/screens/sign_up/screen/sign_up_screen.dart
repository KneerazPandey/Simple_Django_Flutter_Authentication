import 'package:flutter/material.dart';
import 'package:frontend/screens/sign_up/widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: const SingleChildScrollView(
            child: SignUpBody(),
          ),
        ),
      ),
    );
  }
}
