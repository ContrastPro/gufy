import 'package:flutter/material.dart';
import 'package:gufy/global/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gufy/profile_screen/profile_screen.dart';

class ServiceItem extends StatelessWidget {
  final int id;
  final String picture, work, name, surname, phone, payment, time, database;

  ServiceItem(
      {this.id,
      this.picture,
      this.work,
      this.name,
      this.surname,
      this.phone,
      this.payment,
      this.time,
      this.database});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(id: id, database: database),
              ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 5.0),
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('assets/images/$picture'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText(
                          work,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: darkBlue,
                          ),
                          minFontSize: 16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: AutoSizeText(
                                '$name $surname',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: darkBlue,
                                ),
                                minFontSize: 10,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5.0),
                              height: 20,
                              width: 1,
                              color: Colors.grey[350],
                            ),
                            Expanded(
                              child: AutoSizeText(
                                phone,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: darkBlue,
                                ),
                                minFontSize: 12,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
            Container(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 40,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.credit_card,
                          size: 16.0,
                          color: Colors.grey[350],
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: AutoSizeText(
                            payment,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            minFontSize: 12,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        /*Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            shape: BoxShape.circle,
                          ),
                        ),*/
                        Expanded(
                          child: AutoSizeText(
                            time,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.end,
                            minFontSize: 12,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
