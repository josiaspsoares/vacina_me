import 'package:flutter/material.dart';
import 'package:vacina_me/screens/business_plan_screen/components/business_plan_body.dart';
import 'package:vacina_me/screens/business_plan_screen/mobile_business_plan_screen.dart';
import 'package:vacina_me/screens/common_components/app_bar.dart';

class BusinessPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width < 1024) {
      return MobileBusinessPlanScreen();
    }

    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Container(
        height: size.height,
        width: size.width,
        child: BusinessPlanBody(),
      ),
    );
  }
}
