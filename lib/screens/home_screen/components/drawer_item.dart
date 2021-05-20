import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_text_styles.dart';
import 'package:vacina_me/core/app_colors.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.primaryColor.withOpacity(0.9),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: AppTextStyles.drawerItem,
      ),
      onTap: onTap,
    );
  }
}
