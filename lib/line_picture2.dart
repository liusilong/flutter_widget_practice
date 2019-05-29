import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_practice/physical_logical_pixel.dart';
import 'package:screen_orientation/screen_orientation.dart';
import 'dart:ui';

/// 注意： 像素分为两种，物理像素和逻辑像素
/// 二者的关系是：一个或者多个物理像素构成一个逻辑像素。
/// 物理像素如 1px，逻辑像素如 Android 中的 1dp，1dp 表示 一个或者多个 px
/// Flutter 中使用的是逻辑像素
/// "一个或者多个"表示的就是像素密度
class LinePicture2 extends StatefulWidget {
  LinePicture2() {
    // 全屏
    SystemChrome.setEnabledSystemUIOverlays([]);
    // 横屏
    PluginScreenOrientation.setScreenOrientation(ScreenOrientation.landscape);
  }

  @override
  _LinePicture2State createState() => _LinePicture2State();
}

class _LinePicture2State extends State<LinePicture2> {
  // 图片的原始宽高
  final double originImageWidth = 360.0;
  final double originImageHeight = 1125.0;

  // 设备的像素密度
  double screenRatio = window.devicePixelRatio;

  // 小方块的宽高
  double eggWidth, eggHeight;

  // 最终的图片的宽高
  double imageWidth, imageHeight;
  double layoutWidth, layoutHeight;

  @override
  void initState() {
    super.initState();
    eggWidth = 100.0 / screenRatio;
    eggHeight = eggWidth;

    imageWidth = originImageWidth / screenRatio;
    imageHeight = originImageHeight / screenRatio;

    layoutWidth = imageWidth * 15;
    layoutHeight = imageHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: <Widget>[
            Container(
              width: layoutWidth,
              height: layoutHeight,
              child: Row(
                children: _buildBackgroundImage(),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: layoutWidth,
                height: layoutHeight,
                child: Stack(
                  children: _buildEggs(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildEggs() {
    List<Widget> list = [];
    for (int i = 0; i < 15; i++) {
      double topOffset = imageHeight / 2 - eggHeight / 2;
      double leftOffset = i * imageWidth + (imageWidth / 2 - eggWidth / 2);
      list.add(Positioned(
          top: topOffset,
          left: leftOffset,
          child: GestureDetector(
            onTap: () {
              print('top: $topOffset, left: $leftOffset, originWidth: $originImageWidth ,imageWidth: $imageWidth');
            },
            child: Container(
              width: eggWidth,
              height: eggHeight,
              color: getRandomColor(),
            ),
          )));
    }
    return list;
  }

  /// 背景
  List<Widget> _buildBackgroundImage() {
    List<Widget> list = [];
    for (int i = 1; i <= 15; i++) {
      list.add(
        Image.asset(
          'assets/dragon/$i.png',
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.fill,
        ),
      );
    }
    return list;
  }
}
