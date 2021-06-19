import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_text_styles.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/contact_screen/components/contact_texts.dart';
import 'package:vacina_me/screens/contact_screen/components/contact_card.dart';

class ContactBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width / 2.8,
            child: Text(
              contactTitle.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width >= 1250 ? 100 : 80,
                  ),
            ),
          ),
          Container(
            width: size.width / 3,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                SelectableText(
                  contactSubtitle,
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
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
                SizedBox(height: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
