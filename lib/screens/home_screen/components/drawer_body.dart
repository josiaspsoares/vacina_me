import 'package:flutter/material.dart';
import 'package:vacina_me/screens/home_screen/components/drawer_item.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DrawerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 50.0,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
        DrawerItem(
          title: 'Home',
          icon: Icons.home,
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        DrawerItem(
          title: 'Sobre',
          icon: Icons.pages,
          onTap: () {
            Navigator.of(context).pushNamed('/sobre');
          },
        ),
        if (!kIsWeb)
          DrawerItem(
            title: 'Vacinação',
            icon: Icons.medical_services,
            onTap: () {
              Navigator.of(context).pushNamed('/vacinacao');
            },
          ),
        DrawerItem(
          title: 'Contato',
          icon: Icons.contact_page,
          onTap: () {
            Navigator.of(context).pushNamed('/contato');
          },
        ),
        DrawerItem(
          title: 'Plano de Negócios',
          icon: Icons.business,
          onTap: () {
            Navigator.of(context).pushNamed('/plano-de-negocios');
          },
        ),
      ],
    );
  }
}
