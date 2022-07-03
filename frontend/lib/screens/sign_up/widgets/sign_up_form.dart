import 'package:flutter/material.dart';
import 'package:frontend/screens/log_in/screen/log_in_screen.dart';
import 'package:frontend/screens/sign_up/services/sign_up_service.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool isAccepted = false;
  final SignUpService _signUpService = SignUpService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _password1Controller.dispose();
    _password2Controller.dispose();
    _phoneNumberController.dispose();
  }

  void signUpUser() {
    _signUpService.signUp(
      email: _emailController.text,
      password: _password1Controller.text,
      phoneNumber: _phoneNumberController.text,
      context: context,
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
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: 'Phone Number',
            prefixIcon: Icons.phone_rounded,
            controller: _phoneNumberController,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: 'Password',
            prefixIcon: Icons.key_off,
            controller: _password1Controller,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: 'Confirm Password',
            prefixIcon: Icons.key_off,
            controller: _password2Controller,
            obscureText: true,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Checkbox(
                activeColor: Colors.orange,
                value: isAccepted,
                onChanged: (bool? value) {
                  setState(() {
                    isAccepted = value!;
                  });
                },
              ),
              Text(
                'I accept the aggrement',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (_password1Controller.text == _password2Controller.text) {
                  if (isAccepted) {
                    signUpUser();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const LogInScreen();
                        },
                      ),
                    );
                  } else {
                    CustomSnackBar.showSnackBar(
                      context: context,
                      text: 'Please accept the aggrement',
                    );
                  }
                } else {
                  CustomSnackBar.showSnackBar(
                    context: context,
                    text: 'Password and confirm password did not match',
                  );
                }
              }
            },
            buttonName: 'Sign Up',
          ),
        ],
      ),
    );
  }
}
