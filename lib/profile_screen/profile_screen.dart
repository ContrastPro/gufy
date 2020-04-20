import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gufy/data_base/db_masters.dart';
import 'package:gufy/data_base/db_studios.dart';
import 'package:gufy/global/colors.dart';
import 'package:gufy/model/options.dart';
import 'package:gufy/model/person.dart';
import 'package:gufy/profile_screen/edit_profile_screen.dart';
import 'package:gufy/widgets/bottom_bar.dart';
import 'package:gufy/widgets/profile_options.dart';
import 'package:gufy/widgets/profile_portfolio.dart';
import 'package:gufy/widgets/raiting_bar.dart';

class ProfileScreen extends StatefulWidget {
  final int id;
  final String database;

  ProfileScreen({this.id, this.database});

  @override
  _ProfileScreenState createState() => _ProfileScreenState(id, database);
}

class _ProfileScreenState extends State<ProfileScreen> {
  final int id;
  final String database;
  double rating;
  String picture, name, surname, phone, gender, aboutMe;

  _ProfileScreenState(this.id, this.database);

  @override
  void didUpdateWidget(ProfileScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Person>(
        future: MastersDatabaseProvider.db.getPersonWithId(id),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData && database == 'Мастера') {
            Person item = snapshot.data;
            picture = item.picture;
            rating = item.rating;
            name = item.name;
            surname = item.surname;
            phone = item.phone;
            gender = item.gender;
            aboutMe = item.aboutMe;
            return _scaffoldBody(database);
          } else {
            return FutureBuilder<Person>(
                future: StudiosDatabaseProvider.db.getPersonWithId(id),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData && database == 'Студии') {
                    Person item = snapshot.data;
                    picture = item.picture;
                    rating = item.rating;
                    name = item.name;
                    surname = item.surname;
                    phone = item.phone;
                    gender = item.gender;
                    aboutMe = item.aboutMe;
                    return _scaffoldBody(database);
                  } else {
                    return Scaffold(
                        body: Center(child: CircularProgressIndicator()));
                  }
                });
          }
        });
  }

  Widget _scaffoldBody(String category) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _sliverAppBar(),
              _sliverList(),
              SliverFixedExtentList(
                itemExtent: 56.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(
                                  id: id,
                                  picture: picture,
                                  name: name,
                                  surname: surname,
                                  phone: phone,
                                  gender: gender,
                                  aboutMe: aboutMe,
                                  database: category,
                                ),
                              ));
                        }
                      },
                      child: OptionsItem(
                        index: index,
                        title: optionsList[index].title,
                        icon: optionsList[index].icon,
                      ),
                    );
                  },
                  childCount: optionsList.length,
                ),
              ),
              SliverList(
                  delegate:
                      SliverChildListDelegate(<Widget>[SizedBox(height: 80)]))
            ],
          ),
          BottomBar(),
        ],
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      title: Text("Профиль"),
      expandedHeight: 190,
      floating: true,
      pinned: false,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0.0, 60.0, 16.0, 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 0.5,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16.0, 16.0, 10.0, 10.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.phone,
                                    color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Expanded(
                                  child: AutoSizeText(
                                    phone,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.start,
                                    minFontSize: 14,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16.0, 4.0, 10.0, 10.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.person,
                                    color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Expanded(
                                  child: AutoSizeText(
                                    '$name $surname',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.start,
                                    minFontSize: 14,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //swap_horizontal_circle
                          //person
                          //wc
                          Container(
                            margin: EdgeInsets.fromLTRB(16.0, 4.0, 10.0, 10.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.wc, color: Colors.white, size: 20),
                                SizedBox(width: 10),
                                Expanded(
                                  child: AutoSizeText(
                                    '$gender',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.start,
                                    minFontSize: 16,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 20.0, 16.0, 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            radius: 52.0,
                            backgroundImage:
                                AssetImage('assets/images/$picture'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
                            child: StarRating(
                              size: 16,
                              color: Colors.orange[400],
                              starCount: 5,
                              rating: rating,
                            ),
                          ),
                        ),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
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

  Widget _sliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.subtitles,
                      color: darkBlue,
                      size: 20.0,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                        '$aboutMe',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                padding: EdgeInsets.only(bottom: 20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: List.generate(6, (index) {
                  return Portfolio(
                    index: index,
                    image: 'assets/images/test.png',
                  );
                }),
              ),
              Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  'Есть выезд к клиенту на дом',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: darkBlue,
                      fontWeight: FontWeight.bold),
                  minFontSize: 16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 20.0),
              Divider(
                height: 0.0,
                indent: 16.0,
                endIndent: 16.0,
                thickness: 1,
                color: darkBlue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
