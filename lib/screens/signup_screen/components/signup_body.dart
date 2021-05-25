import 'package:flutter/material.dart';
import 'package:vacina_me/screens/signup_screen/components/signup_form.dart';

class SignupBody extends StatefulWidget {
  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: size.width / 3, child: SignupForm()),
          ],
        ),
     
    );
  }
}
