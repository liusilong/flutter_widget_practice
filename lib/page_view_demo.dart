import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class PageViewDemoPage extends StatefulWidget {
  PageViewDemoPage({Key key}) : super(key: key);

  _PageViewDemoPageState createState() => _PageViewDemoPageState();
}

class _PageViewDemoPageState extends State<PageViewDemoPage> {
  double sw, sh;
  @override
  void initState() {
    super.initState();
    sw = window.physicalSize.width;
    sh = window.physicalSize.height;
    print('sw = $sw; sh = $sh');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 300,
              height: sh,
              color: Colors.transparent,
              child: PageView(
                controller: PageController(
                    viewportFraction: 268 / (sh / window.devicePixelRatio)),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            // 这里的 268 是 卡片的高度 + 卡面的 margin 或者 padding
            top: ((sh / window.devicePixelRatio) - 268) / 2,
            child: Container(
              width: 150,
              height: 250,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }

  buildCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      width: 150,
      height: 250,
      color: Colors.red,
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' world!'),
            TextSpan(
                text: ' FLUTTER',
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            TextSpan(
                text: ' FLUTTERasf',
                style: TextStyle(color: Colors.black, fontSize: 20)),
            TextSpan(
                text: ' FLUTTE',
                style: TextStyle(color: Colors.black, fontSize: 20))
          ],
        ),
      ),
    );
  }
}
