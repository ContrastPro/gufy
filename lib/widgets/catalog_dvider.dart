import 'package:flutter/material.dart';

class CatalogDivider extends StatelessWidget {
  final String title;

  CatalogDivider({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Всё'),
            ],
          ),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}
