import 'package:flutter/material.dart';
import 'package:gufy/model/slide.dart';

class ThirdItem extends StatelessWidget {
  final int index;

  ThirdItem(this.index);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 50.0),
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
                  slideList[index].point_1,
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
                  slideList[index].point_5,
                  style: _textStyle,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(40.0, 0.0, 20.0, 20.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/HomeScreen');
            },
            label: Text(
              'Начать',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
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
