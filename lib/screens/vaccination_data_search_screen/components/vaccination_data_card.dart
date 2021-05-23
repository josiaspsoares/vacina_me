import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';

class VaccinationDataCard extends StatelessWidget {
  const VaccinationDataCard({Key? key, required this.name, required this.age})
      : super(key: key);

  final String name;
  final int age;

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
              name,
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
                                'Idade: $age anos',
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
                                'Grupo Prioritário: Não consta',
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
                          color: Color(0xFF3979D3),
                          borderRadius: BorderRadius.circular(28),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: AppColors.border,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(2, 6, 2, 6),
                          child: Text(
                            'Imunizado',
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
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(28),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: AppColors.border,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(2, 6, 2, 6),
                          child: Text(
                            'Coronavac',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
