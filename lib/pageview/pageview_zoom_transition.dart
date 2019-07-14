import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

/// Date: 2019-07-02 17:52
/// Author: Liusilong
/// Description: https://medium.com/@tonyowen/flutter-pageview-zoom-transition-98c380632b2d

class PageViewWithZoomTransitionPage extends StatefulWidget {
  @override
  _PageViewWithZoomTransitionPageState createState() =>
      _PageViewWithZoomTransitionPageState();
}

class _PageViewWithZoomTransitionPageState
    extends State<PageViewWithZoomTransitionPage> {
  double viewPortFraction = 0.3;

  PageController pageController;

  int currentPage = 1;
  double page = 2.0;

  double SCALE_FRACTION = 0.7;
  double FULL_SCALE = 1.0;
  List<Map<String, String>> listOfCharacters = [
    {'image': 'assets/jay/jay_01.jpg', 'name': '001'},
    {'image': 'assets/jay/jay_02.jpeg', 'name': '002'},
    {'image': 'assets/jay/jay_03.jpeg', 'name': '003'},
    {'image': 'assets/jay/jay_04.jpg', 'name': '004'},
    {'image': 'assets/jay/jay_05.jpg', 'name': '005'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          primary: true,
          elevation: 0,
          backgroundColor: Color(0xff7357FF),
          actions: <Widget>[
            Container(
              width: window.physicalSize.width / window.devicePixelRatio,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Image.asset(
                    'assets/back.png',
                    width: 25,
                    height: 15,
                  ),
                  Center(
                    child: Text('我的老师'),
                  )
                ],
              ),
            )
          ],
        ),
        backgroundColor: Color(0xff7357FF),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    setState(() {
                      page = pageController.page;
                    });
                  }
                },
                child: PageView.builder(
                  onPageChanged: (pos) {
                    setState(() {
                      currentPage = pos;
                    });
                  },
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  itemCount: listOfCharacters.length,
                  itemBuilder: (BuildContext context, int index) {
                    final scale = max(SCALE_FRACTION,
                        (FULL_SCALE - (index - page).abs()) + viewPortFraction);
                    return circleOffer(listOfCharacters[index]['image'], scale,
                        onTapCallback: () {
                      print('asdfafadfadsf');
                      pageController.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linearToEaseOut);
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                listOfCharacters[currentPage]['name'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  IntrinsicHeight(
                    child: Container(
                      width: window.physicalSize.width,
                      padding: const EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                          'Lukas毕业于哥伦比亚学院文学创作专业，平日里的他手不释卷，博览群书，知识储备惊人。他从未间断读书学习，也从未停止授课讲学。他享受课堂上与学生的互动，不同文化之间的碰撞。授课经验丰富，表现力超强的他总会不经意间给予学生莫大的启发。'),
                    ),
                  ),
                  Container(
                    width: window.physicalSize.width,
                    height: 5,
                    margin: EdgeInsets.only(left: 16.0, right: 16.0),
                    decoration: BoxDecoration(
                        color: Color(0xff9D89FF),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0))),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/text_flag.png',
                    width: 13.5,
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '证书展示',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Image.asset(
                    'assets/text_flag.png',
                    width: 13.5,
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget circleOffer(String image, double scale, {Function onTapCallback}) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 120 * scale,
          width: 120 * scale,
          child: Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shape: CircleBorder(
                side: BorderSide(color: Colors.grey.shade200, width: 3)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
