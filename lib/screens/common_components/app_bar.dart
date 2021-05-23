import 'package:flutter/material.dart';
import 'package:vacina_me/screens/common_components/custom_button.dart';
import 'package:vacina_me/screens/common_components/menu_item.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CustomAppBar extends PreferredSize {
  final BuildContext context;

  CustomAppBar({required this.context})
      : super(
            preferredSize: Size.fromHeight(150),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(46),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -2),
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.16),
                    ),
                  ]),
              child: Row(
                children: [
                  InkWell(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 50.0,
                      alignment: Alignment.topCenter,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/');
                    },
                  ),
                  Spacer(),
                  MenuItem(
                    text: 'Home',
                    onTap: () {
                      Navigator.of(context).pushNamed('/');
                    },
                  ),
                  MenuItem(
                    text: 'Sobre',
                    onTap: () {
                      Navigator.of(context).pushNamed('/sobre');
                    },
                  ),
                  if (!kIsWeb)
                    MenuItem(
                      text: 'Vacinação',
                      onTap: () {
                        Navigator.of(context).pushNamed('/vacinacao');
                      },
                    ),
                  MenuItem(
                    text: 'Contato',
                    onTap: () {
                      Navigator.of(context).pushNamed('/contato');
                    },
                  ),
                  MenuItem(
                    text: 'Plano de Negócios',
                    onTap: () {
                      Navigator.of(context).pushNamed('/plano-de-negocios');
                    },
                  ),
                  CustomButton(
                    text: 'Vamos Lá',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sobre');
                    },
                  ),
                ],
              ),
            ));
}
