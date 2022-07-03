import 'package:flutter/material.dart';
import 'package:frontend/screens/home/screen/home_screen.dart';
import 'package:frontend/screens/log_in/services/log_in_service.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  bool isRemember = false;
  final LogInService _logInService = LogInService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _password1Controller.dispose();
  }

  void logIn() {
    _logInService.logIn(
      context: context,
      email: _emailController.text,
      password: _password1Controller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextFormField(
            hintText: 'Email Address',
            prefixIcon: Icons.email_outlined,
            controller: _emailController,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'Password',
            prefixIcon: Icons.key_off,
            controller: _password1Controller,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                activeColor: Colors.orange,
                value: isRemember,
                onChanged: (bool? value) {
                  setState(() {
                    isRemember = value!;
                  });
                },
              ),
              Text(
                'Remember Me',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                logIn();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const HomeScreen();
                    },
                  ),
                );
              }
            },
            buttonName: 'Log In',
          ),
        ],
      ),
    );
  }
}
