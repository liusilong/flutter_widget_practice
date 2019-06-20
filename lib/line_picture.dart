


import 'dart:async';

import 'package:flutter/services.dart';
//import 'package:screen_orientation/screen_orientation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class LinePicture extends StatefulWidget {
  @override
  _LinePictureState createState() => _LinePictureState();
}

class _LinePictureState extends State<LinePicture>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  AnimationController _controller;
  
  Animation<double> _animation;
  double sw;
  double sh;
  double ratio;



  @override
  void initState() {
    super.initState();
    sw = 2220;//window.physicalSize.width;
    sh = 1080;//window.physicalSize.height;
    ratio = window.devicePixelRatio;
    print('sw = $sw; sh = $sh');
    // 全屏显示 https://stackoverflow.com/questions/46640116/make-flutter-application-fullscreen
    SystemChrome.setEnabledSystemUIOverlays([]);
    // 横屏
//    PluginScreenOrientation.setScreenOrientation(ScreenOrientation.landscape);


    double a = sw / ratio / 2 * 4;
    double offset = a - (sw / ratio);

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: offset).animate(_controller)
      ..addListener(() {
        setState(() {
          _scrollController.jumpTo(_animation.value);
        });
      })
    ..addStatusListener((status){
      if(status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    _scrollController.addListener(() {
//      print('position is ${_scrollController.position}');
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: NotificationListener<ScrollNotification>(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: sw / ratio / 2,
                  height: sh / ratio,
                  color: Colors.red,
                ),
                Container(
                  width: sw / ratio / 2,
                  height: sh / ratio,
                  color: Colors.blue,
                ),
                Container(
                  width: sw / ratio / 2,
                  height: sh / ratio,
                  color: Colors.green,
                ),
                Container(
                  width: sw / ratio / 2,
                  height: sh / ratio,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              print('is end...');
            } else if (scrollInfo.metrics.pixels == 0) {
              print('is start...');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
//            if (!_controller.isAnimating) {
              _controller.forward();
//            }
          }),
    );
  }
}
