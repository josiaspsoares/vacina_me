import 'package:flutter/material.dart';
import 'package:vacina_me/screens/common_components/app_bar.dart';
import 'package:vacina_me/screens/signup_screen/components/signup_body.dart';
import 'package:vacina_me/screens/signup_screen/mobile_signup_screen.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width < 1024) {
      return MobileSignupScreen();
    }

    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image:
              AssetImage('assets/images/signup_screen/signup_background.png'),
          fit: BoxFit.cover,
        )),
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView(
            children: [
              SizedBox(height: size.height / 9),
              SignupBody(),
              SizedBox(height: size.height / 9),
            ],
          ),
        ),
      ),
    );
  }
}
