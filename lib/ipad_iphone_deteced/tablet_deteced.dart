import 'dart:ui';

import 'package:flutter/material.dart';

class TabletCheckedPage extends StatelessWidget {
  const TabletCheckedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double shortestSide =  window.physicalSize.shortestSide / window.devicePixelRatio;
    print('shortestSide is $shortestSide');
    return MaterialApp(
      home: Scaffold(
        body: shortestSide > 600 ? Center(
          child: Text('I am an iPad'),
        ): Center(
          child: Text('I am an iPhone'),
        ),
      ),
    );
  }
}