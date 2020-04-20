import 'package:flutter/material.dart';
import 'package:gufy/global/colors.dart';

class TabIcon extends StatelessWidget {
  final IconData icon;

  TabIcon({this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 30, color: liteBlue);
  }
}
