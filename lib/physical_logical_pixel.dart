import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:screen_orientation/screen_orientation.dart';

class PhysicalLogicalPixel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PluginScreenOrientation.setScreenOrientation(ScreenOrientation.landscape);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: <Widget>[
              Row(
                children: _buildBackground(),
              ),
              _buildEgg(0),
              _buildEgg(1),
              _buildEgg(2),
              _buildEgg(3),
              _buildEgg(4),
              _buildEgg(5),
              _buildEgg(6),
              _buildEgg(7),
              _buildEgg(8),
              _buildEgg(9),
              _buildEgg(10),
              _buildEgg(11),
              _buildEgg(12),
              _buildEgg(13),
              _buildEgg(14),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBackground() {
    List<Widget> widgets = [];
    for (int i = 1; i <= 15; i++) {
      widgets.add(Image.asset('assets/dragon/$i.png'));
    }
    return widgets;
  }

  Widget _buildEgg(int index) {
    double ratio = window.devicePixelRatio;
    double offsetX = 360 / ratio;
    double pictureW = 360 / ratio;
    double pictureH = 1125 / ratio;
    double ew = 100 / ratio;
    double eh = ew;
    List<Widget> eggs = [];

//    for (int i = 0; i < 15; i++) {
      var egg = Positioned(
        left: index * offsetX + (pictureW / 2 - ew / 2),
        top: pictureH / 2 - eh / 2,
        child: Container(
          width: ew,
          height: eh,
          color: getRandomColor(),
        ),
      );
//      eggs.add(egg);
//    }
    return egg;
  }


}

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(255, random.nextInt(255),
      random.nextInt(255), random.nextInt(255));
}
