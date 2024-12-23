import 'package:flutter/material.dart';

class SettingsItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const SettingsItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appSettingsItems = <SettingsItems>[
  SettingsItems(
    title: 'Nombre',
    subTitle: 'Configurar nombre de usuario',
    link: '/settings/name',
    icon: Icons.person,
  ),
  SettingsItems(
    title: 'Password',
    subTitle: 'Cambiar password',
    link: '/settings/password',
    icon: Icons.password,
  ),
  SettingsItems(
    title: 'Tema',
    subTitle: 'Configurar tema de aplicacion',
    link: '/settings/theme',
    icon: Icons.app_settings_alt_sharp,
  ),
  SettingsItems(
    title: 'Metodo de pago',
    subTitle: 'Configurar metodo de pago',
    link: '/settings/bill',
    icon: Icons.monetization_on_sharp,
  ),
  SettingsItems(
    title: 'Metodo de pago',
    subTitle: 'Configurar metodo de pago',
    link: '/settings/bill',
    icon: Icons.monetization_on_sharp,
  ),
  SettingsItems(
    title: 'Ubicacion',
    subTitle: 'Configurar ubicacion como cliente',
    link: '/settings/location',
    icon: Icons.location_on_rounded,
  ),
];
