import 'package:flutter/material.dart';

class MobilePageTitle extends StatelessWidget {
  const MobilePageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      height: 50.0,
      alignment: Alignment.topCenter,
    );
  }
}