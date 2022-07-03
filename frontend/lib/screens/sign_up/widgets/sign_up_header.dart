import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sign Up',
      style: GoogleFonts.sansita(
        color: Colors.white,
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
