import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vacina_me/models/user_model/user_model.dart';

class VaccinationDataCard extends StatelessWidget {
  VaccinationDataCard({Key? key, required this.model}) : super(key: key);

  final UserModel model;

  final statusConfig = {
    "0": {
      "text": "Em Espera",
      "color": Colors.blueAccent,
      "fontColor": Colors.white,
    },
    "1": {
      "text": "1ª Dose",
      "color": Colors.deepPurpleAccent,
      "fontColor": Colors.white,
    },
    "2": {
      "text": "Imunizado",
      "color": Colors.lightGreen,
      "fontColor": Colors.white,
    },
  };

  final vaccineConfig = {
    "0": {
      "text": "Não Vacinado",
      "color": Colors.red,
      "fontColor": Colors.white,
    },
    "1": {
      "text": "Coronavac",
      "color": AppColors.secondaryColor,
      "fontColor": Colors.white,
    },
    "2": {
      "text": "Covishield",
      "color": AppColors.quaternaryColor,
      "fontColor": Colors.white,
    },
    "3": {
      "text": "Pfizer",
      "color": Colors.teal,
      "fontColor": Colors.white,
    },
    "4": {
      "text": "Janssen",
      "color": Colors.purple,
      "fontColor": Colors.white,
    },
  };

  final priorityGroupConfig = {
    "0": {
      "text": "Não consta",
    },
    "1": {
      "text": "Comorbidades",
    },
  };

  String get statusText => statusConfig[model.vaccinationStatusCode.toString()]!['text']!.toString();
  Color get statusColor => statusConfig[model.vaccinationStatusCode.toString()]!['color']! as Color;
  Color get statusFontColor => statusConfig[model.vaccinationStatusCode.toString()]!['fontColor']! as Color;

  String get vaccineText => vaccineConfig[model.covidVaccineCode.toString()]!['text']!.toString();
  Color get vaccineColor => vaccineConfig[model.covidVaccineCode.toString()]!['color']! as Color;
  Color get vaccineFontColor => vaccineConfig[model.covidVaccineCode.toString()]!['fontColor']! as Color;

  String get priorityGroupText => priorityGroupConfig[model.priorityGroupCode.toString()]!['text']!.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              model.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/vaccination_data_search_screen/user_avatar.png',
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                'Idade: ${model.age} anos',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                'Grupo Prioritário: $priorityGroupText',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(28),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: AppColors.border,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(2, 6, 2, 6),
                          child: Text(
                            statusText,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: Color(0xFFFDFDFD),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: vaccineColor,
                          borderRadius: BorderRadius.circular(28),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: AppColors.border,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(2, 6, 2, 6),
                          child: Text(
                            vaccineText,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: vaccineFontColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
