import 'package:flutter/material.dart';
import 'package:frontend/screens/sign_up/screen/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const SignUpScreen(),
    );
  }
}
