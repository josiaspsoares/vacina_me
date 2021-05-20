import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_text_styles.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/common_components/custom_fitted_button.dart';
import 'package:vacina_me/screens/home_screen/components/home_texts.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            homeTitle.toUpperCase(),
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width >= 1250 ? 110 : 98,
                ),
          ),
          Container(
            width: size.width / 2.5,
            child: SelectableText(
              homeSubtitle,
              style: AppTextStyles.subtitle,
            ),
          ),
          CustomFittedButton(
            text: 'Conheça',
            color: AppColors.homeButton,
            radius: 10,
            onTap: () {
              Navigator.of(context).pushNamed('/sobre');
            },
          ),
        ],
      ),
    );
  }
}
