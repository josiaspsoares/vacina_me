import 'package:flutter/material.dart';
import 'package:vacina_me/screens/common_components/app_bar.dart';
import 'package:vacina_me/screens/vaccination_screen/components/vaccination_body.dart';
import 'package:vacina_me/screens/vaccination_screen/mobile_vaccination_screen.dart';


class VaccinationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width < 1024) {
      return MobileVaccinationScreen();
    }

    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/vaccination_screen/vaccination_background.png'),
          fit: BoxFit.cover,
        )),
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView(
            children: [
              SizedBox(height: size.height / 9),
              VaccinationBody(),
              SizedBox(height: size.height / 9),
            ],
          ),
        ),
      ),
    );
  }
}
