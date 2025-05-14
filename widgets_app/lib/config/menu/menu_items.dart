import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });

}

const appMenuItems = <MenuItem>[
  MenuItem(
    icon: Icons.smart_button_outlined, 
    title: 'Botones', 
    subtitle: 'Varios botones en Flutter', 
    link: '/buttons'),
  MenuItem(
    icon: Icons.list_alt_outlined, 
    title: 'Tarjetas', 
    subtitle: 'Varios tipos de tarjetas en Flutter', 
    link: '/cards'),
];