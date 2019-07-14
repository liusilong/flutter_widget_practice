import 'dart:async';

import 'package:flutter/material.dart';

double cardHeight;
double cardWidth;

class ClipNewHomePage extends StatefulWidget {
  const ClipNewHomePage({Key key}) : super(key: key);

  @override
  _ClipNewHomePageState createState() => _ClipNewHomePageState();
}

class _ClipNewHomePageState extends State<ClipNewHomePage> {
  void initCallback() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 300,
          child: ClipPath(
              clipper: CardClipPath(initCallback),
              child: cardWidth == null
                  ? Container(
                      width: 0,
                      height: 0,
                    )
                  : ClipTestPage(),),
        ),
      ),
    );
  }
}

class ClipTestPage extends StatelessWidget {
  const ClipTestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('cardWidth is $cardWidth');
    return Container(
      color: Colors.red,
      child: Container(width: cardWidth /2,height: cardHeight / 2,color: Colors.blue,),
    );
  }
}

class CardClipPath extends CustomClipper<Path> {
  Path path;

  Function() initCallback;

  CardClipPath(this.initCallback) {
    path = Path();
  }

  @override
  Path getClip(Size size) {
    print('lsl sizi is $size..');
    if (cardHeight == null || cardWidth == null) {
      cardHeight = size.height;
      cardWidth = size.width;
      initCallback();
    }
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // left oval
    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height * 0.7), radius: 10));
    // right oval
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height * 0.7), radius: 10));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
