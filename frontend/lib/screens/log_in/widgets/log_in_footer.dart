import 'package:flutter/material.dart';
import 'package:frontend/screens/sign_up/screen/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInFooter extends StatelessWidget {
  const LogInFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't Have An Account?",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const SignUpScreen(),
              ),
            );
          },
          child: Text(
            'Sign Up',
            style: GoogleFonts.poppins(
              color: Colors.orange,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
