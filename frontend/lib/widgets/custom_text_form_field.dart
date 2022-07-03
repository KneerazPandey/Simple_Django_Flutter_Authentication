import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.orange,
      style: GoogleFonts.poppins(
        color: Colors.white,
        letterSpacing: 0.8,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 36, 36, 36),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.orange),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          color: const Color(0xFFbebebe),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: const Color(0xFFbebebe),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
    );
  }
}
