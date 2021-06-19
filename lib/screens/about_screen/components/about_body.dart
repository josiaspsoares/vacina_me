import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vacina_me/screens/about_screen/components/common_questions_panel.dart';
import 'package:vacina_me/screens/common_components/custom_icon_button.dart';
import 'package:vacina_me/screens/common_components/custom_image_button.dart';

const _githubUrl = 'https://github.com/josiassoares/VacinaMe';
const _articleUrl =
    'https://drive.google.com/file/d/1bLNZjff75g64a2H3RXUf3VdNkgxybTHH/view?usp=sharing';
const _slidesUrl =
    'https://www.canva.com/design/DAEhqB_nMZk/kWU95qHW7EJiKRfMdzXofg/view?utm_content=DAEhqB_nMZk';

class AboutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _launchURL(String url) async => await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width / 2.8,
            child: CommonQuestionsPanel(
              backgroundColor: AppColors.quaternaryColor.withOpacity(0.9),
              headerTextColor: Colors.white,
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            width: size.width / 2.8,
            child: Wrap(
              runSpacing: 25,
              spacing: 25,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                CustomImageButton(
                  onPressed: () {
                    _launchURL(_githubUrl);
                  },
                  imagePath: 'assets/images/about_screen/github_logo.png',
                  color: AppColors.homeButton,
                ),
                CustomIconButton(
                  onPressed: () {
                    _launchURL(_articleUrl);
                  },
                  text: 'Artigo',
                  icon: FontAwesomeIcons.fileAlt,
                  color: AppColors.accentColor,
                ),
                CustomIconButton(
                  onPressed: () {
                    _launchURL(_slidesUrl);
                  },
                  text: 'Slides',
                  icon: FontAwesomeIcons.slideshare,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
