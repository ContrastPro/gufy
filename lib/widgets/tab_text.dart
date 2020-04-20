import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gufy/global/colors.dart';

class TabText extends StatelessWidget {
  final String title;

  TabText({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 4, bottom: 4),
          height: 2,
          width: 65,
          color: liteBlue,
        ),
        AutoSizeText(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          minFontSize: 8.0,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
