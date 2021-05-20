import 'package:flutter/material.dart';
import 'package:vacina_me/screens/about_screen/components/about_body.dart';
import 'package:vacina_me/screens/about_screen/mobile_about_screen.dart';
import 'package:vacina_me/screens/common_components/app_bar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width < 1024) {
      return MobileAboutScreen();
    }

    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/about_screen/about_background.png'),
          fit: BoxFit.cover,
        )),
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView(
            children: [
              SizedBox(height: size.height / 9),
              AboutBody(),
              SizedBox(height: size.height / 9),
            ],
          ),
        ),
      ),
    );
  }
}
