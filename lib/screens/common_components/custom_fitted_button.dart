import 'package:flutter/material.dart';

class CustomFittedButton extends StatelessWidget {
  const CustomFittedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    this.radius = 34.0,
  }) : super(key: key);

  final String text;
  final Color color;
  final double radius;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(radius)),
          child: Row(
            children: [
              Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
