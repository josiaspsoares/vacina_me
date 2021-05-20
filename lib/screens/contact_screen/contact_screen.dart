import 'package:flutter/material.dart';
import 'package:vacina_me/screens/common_components/app_bar.dart';
import 'package:vacina_me/screens/contact_screen/components/contact_body.dart';
import 'package:vacina_me/screens/contact_screen/mobile_contact_screen.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width < 1024) {
      return MobileContactScreen();
    }

    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image:
              AssetImage('assets/images/contact_screen/contact_background.png'),
          fit: BoxFit.cover,
        )),
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView(
            children: [
              SizedBox(height: size.height / 18),
              ContactBody(),
              SizedBox(height: size.height / 18),
            ],
          ),
        ),
      ),
    );
  }
}
