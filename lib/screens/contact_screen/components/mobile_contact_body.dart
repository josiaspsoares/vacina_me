import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vacina_me/core/app_text_styles.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/common_components/custom_fitted_button.dart';
import 'package:vacina_me/screens/contact_screen/components/contact_texts.dart';
import 'package:vacina_me/screens/contact_screen/components/contact_card.dart';

class MobileContactBody extends StatelessWidget {
  const MobileContactBody({
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
                    'assets/images/contact_screen/contact_background.png'),
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
                      contactTitle.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width >= 500 ? 40 : 25,
                          ),
                    ),
                    CustomFittedButton(
                      text: 'Divulgue',
                      color: AppColors.contactScreenButtonColor,
                      onTap: () {
                        Share.share('Conheça a Startup VacinaMe, visite nosso site https://vaciname.web.app e saiba mais!');
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
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        contactSubtitle,
                        textAlign: TextAlign.justify,
                        style: AppTextStyles.mobileSubtitle,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    ContactCard(
                      nome: josiasName,
                      email: josiasEmail,
                      telefone: josiasPhone,
                      avatarImagePath: josiasAvatarImagePath,
                    ),
                    SizedBox(height: 12.0),
                    ContactCard(
                      nome: gustavoName,
                      email: gustavoEmail,
                      telefone: gustavoPhone,
                      avatarImagePath: gustavoAvatarImagePath,
                    ),
                    SizedBox(height: 12.0),
                    ContactCard(
                      nome: lucasName,
                      email: lucasEmail,
                      telefone: lucasPhone,
                      avatarImagePath: lucasAvatarImagePath,
                    ),
                    SizedBox(height: 12.0),
                    ContactCard(
                      nome: matheusName,
                      email: matheusEmail,
                      telefone: matheusPhone,
                      avatarImagePath: matheusAvatarImagePath,
                    ),
                    SizedBox(height: 12.0),
                    ContactCard(
                      nome: emanuelName,
                      email: emanuelEmail,
                      telefone: emanuelPhone,
                      avatarImagePath: emanuelAvatarImagePath,
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
