import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({
    Key? key,
    this.onPressed,
    required this.imagePath,
    this.color,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String imagePath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: ElevatedButton(
        onPressed: onPressed,
        child: Image.asset(
          imagePath,
          height: 50,
          width: 110,
          color: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
      ),
    );
  }
}
