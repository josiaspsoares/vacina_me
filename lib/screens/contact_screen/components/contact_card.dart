import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vacina_me/core/app_colors.dart';

class ContactCard extends StatelessWidget {
  ContactCard({
    Key? key,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.avatarImagePath,
  }) : super(key: key);

  final String nome;
  final String email;
  final String telefone;
  final String avatarImagePath;

  Future<void> _sendEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=Desejo saber mais sobre o VacinaMe&body=Olá ${this.nome}, você poderia me dar mais informações sobre o projeto?',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Future<void> _sendWhatsAppMessage(String numeroCelular) async {
    var whatsappUrl =
        "https://api.whatsapp.com/send?phone=+55${numeroCelular}text=Olá ${this.nome}, gostaria de mais informações sobre o projeto VacinaMe!";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.tertiaryColor,
          ),
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 25,
              foregroundImage: AssetImage(avatarImagePath),
              backgroundColor: Colors.white,
              child: CircularProgressIndicator(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    SelectableText(
                      telefone,
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () => _sendEmail(email),
                icon: Icon(
                  Icons.email,
                  color: AppColors.homeButton.withOpacity(0.7),
                )),
            InkWell(
              onTap: () => _sendWhatsAppMessage(telefone),
              child: Image.asset(
                'assets/images/contact_screen/whatsapp_icon.png',
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
