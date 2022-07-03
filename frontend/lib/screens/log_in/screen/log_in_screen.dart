import 'package:flutter/material.dart';
import 'package:frontend/screens/log_in/widgets/log_in_body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

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
            child: LogInBody(),
          ),
        ),
      ),
    );
  }
}
