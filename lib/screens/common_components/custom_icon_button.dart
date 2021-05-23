import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.icon,
    this.color,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Container(
          height: 50,
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon),
              SizedBox(width: 10.0),
              Text(
                text.toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: 17.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
      ),
    );
  }
}
