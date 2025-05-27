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
    icon: Icons.list_alt_rounded, 
    title: 'Riverpod counter', 
    subtitle: 'Introducción a reiverpod', 
    link: '/counter-river'),
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
  MenuItem(
    icon: Icons.refresh_rounded, 
    title: 'Progreso', 
    subtitle: 'Generales y controlados', 
    link: '/progress'),
  MenuItem(
    icon: Icons.credit_card, 
    title: 'Snackbars', 
    subtitle: 'Snackbars en Flutter', 
    link: '/snackbar'),
  MenuItem(
    icon: Icons.animation_outlined, 
    title: 'Animated container', 
    subtitle: 'Stateful widget animated', 
    link: '/animated'),
  MenuItem(
    icon: Icons.control_camera_outlined, 
    title: 'Controles UI', 
    subtitle: 'Controles de UI en Flutter', 
    link: '/ui_controls'),
  MenuItem(
    icon: Icons.tour_outlined, 
    title: 'Tutorial', 
    subtitle: 'Tutorial de la app', 
    link: '/app_tutorial'),
  MenuItem(
    icon: Icons.credit_card, 
    title: 'Scroll infinito', 
    subtitle: 'Scroll infinito en Flutter', 
    link: '/infinite_scroll'),
  MenuItem(
    icon: Icons.palette_outlined, 
    title: 'Theme Changer', 
    subtitle: 'Cambia el tema de la app', 
    link: '/theme-changer'
  )
];