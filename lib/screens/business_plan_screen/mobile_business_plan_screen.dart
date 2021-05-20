import 'package:flutter/material.dart';
import 'package:vacina_me/screens/business_plan_screen/components/business_plan_body.dart';
import 'package:vacina_me/screens/common_components/mobile_page_title.dart';

class MobileBusinessPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: MobilePageTitle(),
        ),
        body: BusinessPlanBody(),
      ),
    );
  }
}