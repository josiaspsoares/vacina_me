import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/common_components/mobile_page_title.dart';
import 'package:vacina_me/screens/vaccination_screen/components/mobile_vaccination_body.dart';

class MobileSearchVaccinationDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.tertiaryColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: MobilePageTitle(),
          //   title: Text('Conheça'.toUpperCase(), style: GoogleFonts.roboto(
          //   fontSize: 21.0,
          //   color: Colors.white,
          // ),),
        ),
        body: MobileVaccinationBody(size: size),
      ),
    );
  }
}
