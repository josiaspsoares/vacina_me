import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/common_components/custom_fitted_button.dart';
import 'package:vacina_me/screens/vaccination_data_search_screen/components/vaccination_data_search_form.dart';
import 'package:vacina_me/screens/vaccination_data_search_screen/components/vaccination_data_search_texts.dart';

class VaccinationDataSearchBody extends StatefulWidget {
  @override
  _VaccinationDataSearchBodyState createState() =>
      _VaccinationDataSearchBodyState();
}

class _VaccinationDataSearchBodyState extends State<VaccinationDataSearchBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width / 2.8,
            child: Text(
              vaccinationDataSearchTitle.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width >= 1250 ? 85 : 75,
                  ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: size.width / 2.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 65.0),
              child: CustomFittedButton(
                text: vaccinationDataSearchSubtitle,
                color: Color(0xFF00b1b3),
                radius: 10,
                onTap: () {
                  Navigator.of(context).pushNamed('/vacinacao');
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(width: size.width / 3, child: VaccinationDataSearchForm()),
        ],
      ),
    );
  }
}
