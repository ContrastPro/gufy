import 'package:flutter/material.dart';
import 'package:gufy/model/slide.dart';

class SecondItem extends StatelessWidget {
  final int index;

  SecondItem(this.index);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 40.0),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 45.0),
                child: Text(
                  slideList[index].point_1,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 5.0, 12.0, 0.0),
              child: Icon(Icons.fiber_manual_record, size: 12),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 16.0, bottom: 45.0),
                child: Text(
                  slideList[index].point_2,
                  style: _textStyle,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 5.0, 12.0, 0.0),
              child: Icon(Icons.fiber_manual_record, size: 12),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 16.0, bottom: 45.0),
                child: Text(
                  slideList[index].point_3,
                  style: _textStyle,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 5.0, 12.0, 0.0),
              child: Icon(Icons.fiber_manual_record, size: 12),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 16.0, bottom: 45.0),
                child: Text(
                  slideList[index].point_4,
                  style: _textStyle,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 45.0),
                child: Text(
                  slideList[index].point_5,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

TextStyle _textStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
);

TextStyle textStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
);
