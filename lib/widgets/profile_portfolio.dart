import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  Portfolio({this.index, this.image});

  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      child: GestureDetector(
        child: Hero(
          tag: '$index',
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        onTap: () => _showFullSize(context),
      ),
    );
  }

  void _showFullSize(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          body: GestureDetector(
            child: Center(
              child: Hero(
                tag: '$index',
                child: Image.asset(image),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
