import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/common_components/custom_fitted_button.dart';
import 'package:vacina_me/screens/vaccination_screen/components/vaccination_register_form.dart';
import 'package:vacina_me/screens/vaccination_screen/components/vaccination_texts.dart';


class MobileVaccinationBody extends StatefulWidget {
  const MobileVaccinationBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _MobileVaccinationBodyState createState() => _MobileVaccinationBodyState();
}

class _MobileVaccinationBodyState extends State<MobileVaccinationBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                child: Image.asset(
                    'assets/images/vaccination_screen/vaccination_background.png'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(80.0)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.size.width / 10),
                child: Column(
                  children: [
                    Text(
                      vaccinationTitle.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: widget.size.width >= 500 ? 40 : 25,
                          ),
                    ),
                    CustomFittedButton(
                      text: 'CONSULTAR',
                      color: AppColors.accentColor,
                      onTap: () {
                        Navigator.of(context).pushNamed('/vacinacao/consulta');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: widget.size.width / 14, vertical: 30),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                   VaccinationRegisterForm(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}