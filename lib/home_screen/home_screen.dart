import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gufy/global/colors.dart';
import 'package:gufy/model/favorites.dart';
import 'package:gufy/model/service.dart';
import 'package:gufy/service/service_screen.dart';
import 'package:gufy/widgets/bottom_bar.dart';
import 'package:gufy/widgets/catalog_dvider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Favorites> favorites = <Favorites>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
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
      expandedHeight: 130,
      floating: true,
      pinned: false,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SafeArea(
              child: Container(
                margin: EdgeInsets.fromLTRB(36.0, 32.0, 36.0, 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                          'Каталог услуг',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                          minFontSize: 16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Icon(Icons.person, size: 35, color: Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          size: 22,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            decoration: InputDecoration.collapsed(
                              hintText: 'Одесса',
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setFavorites() {
    if (favorites.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.star,
            size: 50,
            color: darkBlue,
          ),
          Text('Здесь пока ничего нет.', textAlign: TextAlign.center)
        ],
      );
    } else {
      return GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        padding: EdgeInsets.symmetric(vertical: 10),
        children: List.generate(favorites.length, (index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServiceScreen(
                              title: favorites[index].title,
                              index: 0,
                            )));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (favorites[index].like == true) {
                              final tile = serviceList.firstWhere(
                                  (item) => item.id == favorites[index].id);
                              setState(() => tile.like = false);
                              favorites.removeAt(index);
                            }
                          });
                        },
                        borderRadius: BorderRadius.circular(45.0),
                        child: Icon(
                          favorites[index].like
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 22.0,
                          color: favorites[index].like ? liteBlue : liteBlue,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        favorites[index].title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        minFontSize: 12,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    }
  }

  Widget _sliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CatalogDivider(title: 'Избранное'),
              Container(
                height: 150,
                child: Scrollbar(
                  child: _setFavorites(),
                ),
              ),
              CatalogDivider(title: 'Студии'),
              Container(
                height: 280,
                child: Scrollbar(
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    children: List.generate(serviceList.length, (index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServiceScreen(
                                          title: serviceList[index].title,
                                          index: 1,
                                        )));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (serviceList[index].like == false) {
                                          final tile = serviceList.firstWhere(
                                              (item) =>
                                                  item.id ==
                                                  serviceList[index].id);
                                          setState(() => tile.like = true);
                                          favorites.add(
                                            Favorites(
                                              title: serviceList[index].title,
                                              like: true,
                                              id: serviceList[index].id,
                                            ),
                                          );
                                        }
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(45.0),
                                    child: Icon(
                                      serviceList[index].like
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 22.0,
                                      color: serviceList[index].like
                                          ? liteBlue
                                          : liteBlue,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    serviceList[index].title,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                    minFontSize: 12,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              CatalogDivider(title: 'Мастера'),
              Container(
                height: 280,
                child: Scrollbar(
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    children: List.generate(serviceList.length, (index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServiceScreen(
                                          title: serviceList[index].title,
                                          index: 0,
                                        )));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (serviceList[index].like == false) {
                                          final tile = serviceList.firstWhere(
                                              (item) =>
                                                  item.id ==
                                                  serviceList[index].id);
                                          setState(() => tile.like = true);
                                          favorites.add(
                                            Favorites(
                                              title: serviceList[index].title,
                                              like: true,
                                              id: serviceList[index].id,
                                            ),
                                          );
                                        }
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(45.0),
                                    child: Icon(
                                      serviceList[index].like
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 22.0,
                                      color: serviceList[index].like
                                          ? liteBlue
                                          : liteBlue,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    serviceList[index].title,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                    minFontSize: 12,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              CatalogDivider(title: 'Всё'),
              GridView.count(
                padding: EdgeInsets.only(bottom: 80),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: List.generate(serviceList.length, (index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceScreen(
                                      title: serviceList[index].title,
                                      index: 0,
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (serviceList[index].like == false) {
                                      final tile = serviceList.firstWhere(
                                          (item) =>
                                              item.id == serviceList[index].id);
                                      setState(() => tile.like = true);
                                      favorites.add(
                                        Favorites(
                                          title: serviceList[index].title,
                                          like: true,
                                          id: serviceList[index].id,
                                        ),
                                      );
                                    }
                                  });
                                },
                                borderRadius: BorderRadius.circular(45.0),
                                child: Icon(
                                  serviceList[index].like
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 22.0,
                                  color: serviceList[index].like
                                      ? liteBlue
                                      : liteBlue,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                serviceList[index].title,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                minFontSize: 12,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
