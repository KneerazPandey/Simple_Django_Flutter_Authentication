import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonName,
                style: GoogleFonts.poppins(
                  fontSize: 17.5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
