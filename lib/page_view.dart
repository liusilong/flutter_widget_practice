import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_orientation/screen_orientation.dart';
import 'physical_logical_pixel.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    PluginScreenOrientation.setScreenOrientation(ScreenOrientation.landscape);
    SystemChrome.setEnabledSystemUIOverlays([]);
    pageController = new PageController(viewportFraction: 0.75);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: 200,
            height: 100,
            color: Colors.red,
            child: Center(
              child: Text(
                '$pageIndex',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  setState(() {
                    pageIndex = pageController.page.toInt();
                  });
                }
              },
              child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (int page) {
//                    if (pageIndex != page) {
//                      setState(() {
//                        pageIndex = page;
//                      });
//                    }
                  },
                  children: _buildCardList()),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildCardList() {
    List<Widget> cardList = [];
    for (int i = 0; i < 8; i++) {
      cardList.add(_buildCard(Colors.lightBlue));
    }
    return cardList;
  }

  _buildCard(Color color) {
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: color,
          ),
        ),
      ),
    );
  }
}
