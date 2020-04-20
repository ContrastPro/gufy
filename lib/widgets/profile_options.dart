import 'package:flutter/material.dart';
import 'package:gufy/global/colors.dart';

class OptionsItem extends StatelessWidget {
  final int index;
  final String title;
  final IconData icon;

  OptionsItem({this.index, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(icon, color: Colors.blue[300]),
            title: index == 1
                ? Row(
                    children: <Widget>[
                      Text(title),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(title),
          ),
          Divider(
            thickness: index == 4 ? 1 : 0.0,
            color: index == 4 ? darkBlue : Colors.grey,
            height: 0.0,
            indent: 16.0,
            endIndent: 16.0,
          ),
        ],
      ),
    );
  }
}
