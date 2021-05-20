import 'package:flutter/material.dart';
import 'package:vacina_me/screens/search_vaccination_data_screen/components/vaccination_data_card.dart';
import 'package:vacina_me/screens/search_vaccination_data_screen/components/vaccination_search_form.dart';

class MobileSearchVaccinationDataBody extends StatefulWidget {
  const MobileSearchVaccinationDataBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _MobileSearchVaccinationDataBodyState createState() =>
      _MobileSearchVaccinationDataBodyState();
}

class _MobileSearchVaccinationDataBodyState
    extends State<MobileSearchVaccinationDataBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: VaccinationSearchForm(),
                ),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(80.0)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: VaccinationDataCard(),
          ),
        ],
      ),
    );
  }
}
