import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/models/database_model/database_model.dart';
import 'package:vacina_me/screens/about_screen/about_screen.dart';
import 'package:vacina_me/screens/business_plan_screen/business_plan_screen.dart';
import 'package:vacina_me/screens/contact_screen/contact_screen.dart';
import 'package:vacina_me/screens/home_screen/home_screen.dart';
import 'package:vacina_me/screens/signup_screen/signup_screen.dart';
import 'package:vacina_me/screens/vaccination_data_search_screen/vaccination_data_search_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'VacinaMe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/sobre': (context) => AboutScreen(),
          '/vacinacao': (context) => ChangeNotifierProvider(
                create: (context) => DatabaseModel(),
                child: SignupScreen(),
              ),
          '/vacinacao/consulta': (context) => ChangeNotifierProvider(
                create: (context) => DatabaseModel(),
                child: VaccinationDataSearchScreen(),
              ),
          '/contato': (context) => ContactScreen(),
          '/plano-de-negocios': (context) => BusinessPlanScreen(),
        });
  }
}
