import 'package:flutter/material.dart';
import 'package:vacina_me/screens/common_components/mobile_page_title.dart';
import 'package:vacina_me/screens/search_vaccination_data_screen/components/mobile_search_vaccination_data_body.dart';

class MobileSearchVaccinationDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: MobilePageTitle(),
        ),
        body: MobileSearchVaccinationDataBody(size: size),
      ),
    );
  }
}
