import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gufy/app_intro_screen/first_item.dart';
import 'package:gufy/app_intro_screen/second_item.dart';
import 'package:gufy/app_intro_screen/third_item.dart';
import 'package:gufy/global/colors.dart';
import 'package:gufy/model/slide.dart';

class AppIntro extends StatefulWidget {
  @override
  _AppIntroState createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  int _currentItem = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _listOfItems = [
    FirstItem(0),
    SecondItem(1),
    ThirdItem(2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: darkBlue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(36.0, 52.0, 35.0, 12.0),
                    child: Text(
                      'Г.У.Ф.И',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(36.0, 0.0, 18.0, 24.0),
                    child: AutoSizeText(
                      slideList[_currentItem].title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.start,
                      minFontSize: 14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _listOfItems.length,
                itemBuilder: (context, i) => _listOfItems[i],
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Radio(
                        activeColor: liteBlue,
                        value: 0,
                        groupValue: _currentItem,
                        onChanged: (t) {},
                      ),
                      Radio(
                        activeColor: liteBlue,
                        value: 1,
                        groupValue: _currentItem,
                        onChanged: (t) {},
                      ),
                      Radio(
                        activeColor: liteBlue,
                        value: 2,
                        groupValue: _currentItem,
                        onChanged: (t) {},
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentItem = index;
    });
  }
}
