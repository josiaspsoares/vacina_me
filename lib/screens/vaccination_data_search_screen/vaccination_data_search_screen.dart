import 'package:flutter/material.dart';
import 'package:vacina_me/screens/common_components/app_bar.dart';
import 'package:vacina_me/screens/signup_screen/components/signup_body.dart';
import 'package:vacina_me/screens/vaccination_data_search_screen/mobile_vaccination_data_search_screen.dart';

class VaccinationDataSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width < 1024) {
      return MobileVaccinationDataSearchScreen();
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
              SignupBody(),
              SizedBox(height: size.height / 9),
            ],
          ),
        ),
      ),
    );
  }
}
