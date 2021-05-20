import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/about_screen/components/about_texts.dart';
import 'package:vacina_me/screens/about_screen/components/common_questions_panel.dart';
import 'package:vacina_me/screens/common_components/custom_fitted_button.dart';
import 'package:vacina_me/screens/common_components/custom_icon_button.dart';
import 'package:vacina_me/screens/common_components/custom_image_button.dart';

const _githubUrl = 'https://github.com/josiassoares/VacinaMe';

class MobileAboutBody extends StatelessWidget {
  const MobileAboutBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  void _launchURL() async => await canLaunch(_githubUrl)
      ? await launch(_githubUrl)
      : throw 'Could not launch $_githubUrl';

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
                    'assets/images/about_screen/about_background.png'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(80.0)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width / 10),
                child: Column(
                  children: [
                    Text(
                      aboutTitle.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width >= 500 ? 40 : 25,
                          ),
                    ),
                    CustomFittedButton(
                      text: 'Contate',
                      color: AppColors.accentColor,
                      onTap: () {
                        Navigator.of(context).pushNamed('/contato');
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
                    horizontal: size.width / 14, vertical: 30),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    CommonQuestionsPanel(
                      backgroundColor: AppColors.quaternaryColor.withOpacity(0.9),
                      headerTextColor: Colors.white,
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      children: [
                        CustomImageButton(
                          onPressed: _launchURL,
                          imagePath:
                              'assets/images/about_screen/github_logo.png',
                          color: AppColors.homeButton,
                        ),
                        SizedBox(width: 15.0),
                        CustomIconButton(
                          onPressed: () {},
                          text: 'Artigo',
                          icon: FontAwesomeIcons.fileAlt,
                          color: AppColors.accentColor,
                        ),
                      ],
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
