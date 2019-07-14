import 'dart:ui';

import 'package:flutter/material.dart';

/// Date: 2019-07-09 11:15
/// Author: Liusilong
/// Description:
///
//

class ClipPathGuide extends StatefulWidget {
  @override
  _ClipPathGuideState createState() => _ClipPathGuideState();
}

class _ClipPathGuideState extends State<ClipPathGuide> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SafeArea(
        child: new Stack(
          children: <Widget>[
            new GestureDetector(
              onTap: () {},
              child: new Container(
                color: Colors.white,
                child: new Center(
                  child: RaisedButton(
                    onPressed: () {
                      print('asfasdfsf');
                    },
                    child: Text('Button'),
                  ),
                ),
              ),
            ),
            new ClipPath(
              clipper: new InvertedCircleClipper(),
              child: new Container(
                width: window.physicalSize.width / window.devicePixelRatio,
                height: window.physicalSize.height / window.devicePixelRatio,
                color: new Color.fromRGBO(0, 0, 0, 0.5),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: window.physicalSize.height / window.devicePixelRatio * 0.5,
                      left: window.physicalSize.width / window.devicePixelRatio * 0.5,
                      child: Container(
                        color: Colors.orangeAccent,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InvertedCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return new Path()
      ..addOval(new Rect.fromCircle(
          center: new Offset(size.width / 2, size.height / 2),
          radius: size.width * 0.15))
      ..addRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class GuidePath extends CustomClipper<Path> {
  Path path = Path();

  @override
  Path getClip(Size size) {
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height * 0.7), radius: 10));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height * 0.7), radius: 10));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
