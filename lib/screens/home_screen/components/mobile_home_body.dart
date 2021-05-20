import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_text_styles.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/common_components/custom_fitted_button.dart';
import 'package:vacina_me/screens/home_screen/components/home_texts.dart';

class MobileHomeBody extends StatelessWidget {
  const MobileHomeBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

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
                    'assets/images/home_screen/home_background.png'),
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
                      homeTitle.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width >= 500 ? 40 : 25,
                          ),
                    ),
                    CustomFittedButton(
                      text: 'Conheça',
                      color: AppColors.primaryColor,
                      onTap: () {
                        Navigator.of(context).pushNamed('/sobre');
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
                padding: EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text(
                      homeSubtitle,
                      textAlign: TextAlign.justify,
                      style: AppTextStyles.mobileSubtitle,
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20, horizontal: size.width / 20),
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                            'assets/images/home_screen/injection_icon.png')),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
