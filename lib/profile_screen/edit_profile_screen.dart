import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gufy/data_base/db_masters.dart';
import 'package:gufy/data_base/db_studios.dart';
import 'package:gufy/model/person.dart';
import 'package:gufy/widgets/bottom_bar.dart';

class EditProfileScreen extends StatefulWidget {
  final int id;
  final String picture, name, surname, phone, gender, aboutMe, database;

  EditProfileScreen({
    this.id,
    this.picture,
    this.name,
    this.surname,
    this.phone,
    this.gender,
    this.aboutMe,
    this.database,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState(
      id, picture, name, surname, phone, gender, aboutMe, database);
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final int id;
  final String picture, name, surname, phone, gender, aboutMe, database;
  TextEditingController cName, cSurname, cPhone, cGender, cAboutMe;

  _EditProfileScreenState(
    this.id,
    this.picture,
    this.name,
    this.surname,
    this.phone,
    this.gender,
    this.aboutMe,
    this.database,
  );

  @override
  void initState() {
    super.initState();
    cName = TextEditingController();
    cSurname = TextEditingController();
    cPhone = TextEditingController();
    cGender = TextEditingController();
    cAboutMe = TextEditingController();
    cName.text = name;
    cSurname.text = surname;
    cPhone.text = phone;
    cGender.text = gender;
    cAboutMe.text = aboutMe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _sliverAppBar(),
              _sliverList(),
            ],
          ),
          BottomBar(),
        ],
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      title: Padding(
        padding: const EdgeInsets.only(right: 70),
        child: AutoSizeText(
          'Редактировать профиль',
          textAlign: TextAlign.start,
          minFontSize: 14,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      expandedHeight: 110,
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
                            margin: EdgeInsets.fromLTRB(30.0, 5.0, 10.0, 5.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: AutoSizeText(
                                    '$phone',
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 20.0, 16.0, 5.0),
                    child: CircleAvatar(
                      radius: 34.0,
                      backgroundImage: AssetImage('assets/images/$picture'),
                      backgroundColor: Colors.transparent,
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
                margin: EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 30.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: cName,
                      decoration: InputDecoration(
                        labelText: 'Имя',
                        suffixIcon: IconButton(
                          tooltip: 'Применить',
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                          ),
                          onPressed: () {
                            if (database == 'Мастера') {
                              MastersDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'name',
                                newValue: cName.text,
                              );
                            } else {
                              StudiosDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'name',
                                newValue: cName.text,
                              );
                            }
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: cSurname,
                      decoration: InputDecoration(
                        labelText: 'Фамилия',
                        suffixIcon: IconButton(
                          tooltip: 'Применить',
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                          ),
                          onPressed: () {
                            if (database == 'Мастера') {
                              MastersDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'surname',
                                newValue: cSurname.text,
                              );
                            } else {
                              StudiosDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'surname',
                                newValue: cSurname.text,
                              );
                            }
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: cPhone,
                      decoration: InputDecoration(
                        labelText: 'Телефон',
                        suffixIcon: IconButton(
                          tooltip: 'Применить',
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                          ),
                          onPressed: () {
                            if (database == 'Мастера') {
                              MastersDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'phone',
                                newValue: cPhone.text,
                              );
                            } else {
                              StudiosDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'phone',
                                newValue: cPhone.text,
                              );
                            }
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: cGender,
                      decoration: InputDecoration(
                        labelText: 'Пол',
                        suffixIcon: IconButton(
                          tooltip: 'Применить',
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                          ),
                          onPressed: () {
                            if (database == 'Мастера') {
                              MastersDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'gender',
                                newValue: cGender.text,
                              );
                            } else {
                              StudiosDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'gender',
                                newValue: cGender.text,
                              );
                            }
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: cAboutMe,
                      decoration: InputDecoration(
                        labelText: 'Информация о себе',
                        suffixIcon: IconButton(
                          tooltip: 'Применить',
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.0,
                          ),
                          onPressed: () {
                            if (database == 'Мастера') {
                              MastersDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'aboutMe',
                                newValue: cAboutMe.text,
                              );
                            } else {
                              StudiosDatabaseProvider.db.updatePerson(
                                person: Person(id: id),
                                raw: 'aboutMe',
                                newValue: cAboutMe.text,
                              );
                            }
                            Navigator.pop(context);
                          },
                        ),
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
                  return Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Icon(
                              Icons.collections,
                              size: 40,
                              color: Colors.black87,
                            ),
                            flex: 60,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              'Загрузите\nпортфолио',
                              textAlign: TextAlign.center,
                              minFontSize: 14,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            flex: 40,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 80.0),
            ],
          ),
        ],
      ),
    );
  }
}
