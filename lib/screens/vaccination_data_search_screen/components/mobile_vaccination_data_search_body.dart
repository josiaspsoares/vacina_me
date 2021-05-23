import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/common_components/custom_fitted_button.dart';
import 'package:vacina_me/screens/vaccination_data_search_screen/components/vaccination_data_search_form.dart';

class MobileVaccinationDataSearchBody extends StatefulWidget {
  const MobileVaccinationDataSearchBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _MobileVaccinationDataSearchBodyState createState() =>
      _MobileVaccinationDataSearchBodyState();
}

class _MobileVaccinationDataSearchBodyState
    extends State<MobileVaccinationDataSearchBody> {
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
                    'assets/images/vaccination_data_search_screen/vaccination_data_search_background.png'),
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
                      'Consulte'.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: widget.size.width >= 500 ? 40 : 25,
                          ),
                    ),
                    CustomFittedButton(
                      text: 'VOLTE',
                      color: Color(0xFF467CDE),
                      onTap: () {
                        Navigator.pop(context);
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: VaccinationDataSearchForm(),
                    ),
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
