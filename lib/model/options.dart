import 'package:flutter/material.dart';

class Options {
  IconData icon;
  String title;

  Options({this.icon, this.title});
}

final optionsList = [
  Options(
    icon: Icons.verified_user,
    title: 'Сертификаты',
  ),
  Options(
    icon: Icons.message,
    title: 'Мои сообщения',
  ),
  Options(
    icon: Icons.event_note,
    title: 'Календарь',
  ),
  Options(
    icon: Icons.monetization_on,
    title: 'Услуги и цены',
  ),
  Options(
    icon: Icons.star,
    title: 'Избранные мастера и услуги',
  ),
  Options(
    icon: Icons.edit,
    title: 'Редактировать профиль',
  ),
  Options(
    icon: Icons.question_answer,
    title: 'F.A.Q',
  ),
  Options(
    icon: Icons.exit_to_app,
    title: 'Выход',
  ),
];
