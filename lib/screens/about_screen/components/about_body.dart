import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/about_screen/components/about_texts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vacina_me/screens/about_screen/components/common_questions_panel.dart';
import 'package:vacina_me/screens/common_components/custom_icon_button.dart';
import 'package:vacina_me/screens/common_components/custom_image_button.dart';

const _githubUrl = 'https://github.com/josiassoares/VacinaMe';

class AboutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _launchURL() async => await canLaunch(_githubUrl)
        ? await launch(_githubUrl)
        : throw 'Could not launch $_githubUrl';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            aboutTitle.toUpperCase(),
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width >= 1250 ? 110 : 98,
                ),
          ),
          SizedBox(height: 40.0),
          Container(
            width: size.width / 2.8,
            child: CommonQuestionsPanel(
              backgroundColor: AppColors.quaternaryColor.withOpacity(0.9),
              headerTextColor: Colors.white,
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            width: 300,
            child: Row(
              children: [
                CustomImageButton(
                  onPressed: _launchURL,
                  imagePath: 'assets/images/about_screen/github_logo.png',
                  color: AppColors.homeButton,
                ),
                SizedBox(width: 25.0),
                CustomIconButton(
                  onPressed: () {},
                  text: 'Artigo',
                  icon: FontAwesomeIcons.fileAlt,
                  color: AppColors.accentColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
