import 'package:flutter/material.dart';
import 'package:gufy/global/colors.dart';
import 'package:gufy/widgets/tab_icon.dart';
import 'package:gufy/widgets/tab_text.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: darkBlue),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            currentIndex: index,
            onTap: (int t) {
              setState(() {
                index = t;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: TabIcon(icon: Icons.format_list_bulleted),
                title: TabText(title: "услуги"),
              ),
              BottomNavigationBarItem(
                icon: TabIcon(icon: Icons.date_range),
                title: TabText(title: "я исполнитель"),
              ),
              BottomNavigationBarItem(
                icon: TabIcon(icon: Icons.star_border),
                title: TabText(title: "я модель"),
              ),
              BottomNavigationBarItem(
                icon: TabIcon(icon: Icons.person),
                title: TabText(title: "я заказчик"),
              ),
            ],
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
