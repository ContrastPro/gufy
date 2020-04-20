import 'package:gufy/data_base/db_masters.dart';
import 'package:gufy/data_base/db_studios.dart';
import 'package:gufy/widgets/bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:gufy/model/person.dart';
import 'package:gufy/widgets/service_item.dart';

class ServiceScreen extends StatefulWidget {
  final String title;
  final int index;

  ServiceScreen({this.title, this.index});

  @override
  _ServiceScreenState createState() =>
      _ServiceScreenState(title: title, index: index);
}

class _ServiceScreenState extends State<ServiceScreen>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(ServiceScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  _ServiceScreenState({this.title, this.index});

  TabController _tabController;
  final String title;
  final int index;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final myTabs = <Tab>[
    Tab(text: 'Мастера'),
    Tab(text: 'Студии'),
  ];

  Future<void> _updateUI() async {
    await MastersDatabaseProvider.db.getAllPersons();
    await StudiosDatabaseProvider.db.getAllPersons();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      FutureBuilder<List<Person>>(
        future: MastersDatabaseProvider.db.getAllPersons(),
        builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: ListView.builder(
                padding: EdgeInsets.only(bottom: 80.0),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Person item = snapshot.data[index];
                  return Dismissible(
                    key: UniqueKey(),
                    child: ServiceItem(
                      id: item.id,
                      picture: item.picture,
                      work: item.work,
                      name: item.name,
                      surname: item.surname,
                      phone: item.phone,
                      payment: item.payment,
                      time: item.time,
                      database: 'Мастера',
                    ),
                    onDismissed: (direction) async {
                      MastersDatabaseProvider.db.deletePersonWithId(item.id);
                      await _updateUI();
                    },
                  );
                },
              ),
            );
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
      FutureBuilder<List<Person>>(
        future: StudiosDatabaseProvider.db.getAllPersons(),
        builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: ListView.builder(
                padding: EdgeInsets.only(bottom: 80.0),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Person item = snapshot.data[index];
                  return Dismissible(
                    key: UniqueKey(),
                    child: ServiceItem(
                      id: item.id,
                      picture: item.picture,
                      work: item.work,
                      name: item.name,
                      surname: item.surname,
                      phone: item.phone,
                      payment: item.payment,
                      time: item.time,
                      database: 'Студии',
                    ),
                    onDismissed: (direction) async {
                      StudiosDatabaseProvider.db.deletePersonWithId(item.id);
                      await _updateUI();
                    },
                  );
                },
              ),
            );
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.place),
              onPressed: () async {
                if (_tabController.index == 0) {
                  await _createMaster();
                } else {
                  await _createStudio();
                }
                _updateUI();
              },
            ),
          ),
        ],
        elevation: 15,
        title: Text(title),
      ),
      body: Stack(
        children: <Widget>[
          TabBarView(
            controller: _tabController,
            children: _kTabPages,
          ),
          BottomBar(),
        ],
      ),
    );
  }

  _createMaster() async {
    await MastersDatabaseProvider.db.addPersonToDatabase(
      Person(
        rating: 2.0,
        work: "Покрытие гель-лаком",
        picture: "masters_profile.png",
        name: "Harrison",
        surname: "Mcpherson",
        phone: "+38 (959) 424-2020",
        gender: "Мужской",
        aboutMe:
            "Доброго времени суток! Професионально предоставляю услуги по Пирсингу.Только лучшие и стильные материалы в городе. Спешите записаться на сеанс, время ограничено.",
        payment: "Полная оплата",
        time: "с 8:00 до 22:00 в будни",
      ),
    );
  }

  _createStudio() async {
    await StudiosDatabaseProvider.db.addPersonToDatabase(
      Person(
        rating: 4.5,
        work: "Мелирование",
        picture: "studios_profile.png",
        name: "SIGNI",
        surname: "DYNE",
        phone: "+38 (215) 519-3471",
        gender: "Не указано",
        aboutMe: "Лучшее мелирование в городе, только у нас!",
        payment: "Частичная оплата",
        time: "с 11:40 до 16:30 всегда",
      ),
    );
  }
}
