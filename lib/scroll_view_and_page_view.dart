import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollViewWithPageView extends StatefulWidget {
  ScrollViewWithPageView({Key key}) : super(key: key);

  _ScrollViewWithPageViewState createState() => _ScrollViewWithPageViewState();
}

class _ScrollViewWithPageViewState extends State<ScrollViewWithPageView> {
  final List<Widget> _topPages = [
    Container(
      width: 375,
      margin: EdgeInsets.only(right: 8.0, left: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
    ),
    Container(
      width: 375,
      margin: EdgeInsets.only(right: 8.0, left: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
    ),
    Container(
      width: 375,
      margin: EdgeInsets.only(right: 8.0, left: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 20,
              ),
              Container(
                height: 500,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: PageView.builder(
                  itemCount: _topPages.length,
                  controller: PageController(viewportFraction: 1.0),
                  itemBuilder: (BuildContext context, int index) {
                    return _topPages[index];
                  },
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 500,
                child: PageView.builder(
                  itemCount: _topPages.length,
                  controller: PageController(),
                  itemBuilder: (BuildContext context, int index) {
                    return _topPages[index];
                  },
                ),
              ),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
