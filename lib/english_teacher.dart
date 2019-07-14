import 'dart:ui';

import 'package:flutter/material.dart';

/// https://gist.github.com/MohamedGhoneim/e5b298e140df1e94ca9f87d532cb6e2b

class EnglishTeacherPage extends StatefulWidget {
  EnglishTeacherPage({Key key}) : super(key: key);

  _EnglishTeacherPageState createState() => _EnglishTeacherPageState();
}

class _EnglishTeacherPageState extends State<EnglishTeacherPage>
    with TickerProviderStateMixin {
  GlobalKey _redKey = GlobalKey();
  GlobalKey _greenKey = GlobalKey();
  GlobalKey _blueKey = GlobalKey();

  Size redSize, greenSize, blueSize;
  Offset redOffset, greenOffset, blueOffset;

  Animation<double> blueScale;
  Animation<double> blueTranslate;

  AnimationController controller;

  static const double smallSize = 50;
  static const double largeSize = 80;

  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback(_afterLayout);
    super.initState();
  }

  bool init = false;

  // 点击：动画，非点击：线型赋值
  _afterLayout(_) {
    if (!init) {
      init = true;
      final RenderBox redBox = _redKey.currentContext.findRenderObject();
      final RenderBox greenBox = _greenKey.currentContext.findRenderObject();
      final RenderBox blueBox = _blueKey.currentContext.findRenderObject();
      redSize = redBox.size;
      redOffset = redBox.localToGlobal(Offset.zero);
      greenSize = greenBox.size;
      greenOffset = greenBox.localToGlobal(Offset.zero);
      blueSize = blueBox.size;
      blueOffset = blueBox.localToGlobal(Offset.zero);
      print('redSize: $redSize; redOffset: $redOffset');
      print('greenSize: $greenSize; greenOffset: $greenOffset');
      print('blueSize: $blueSize; blueOffset: $blueOffset');
      initAnimate();
    }
  }

  double blueOriginSize = smallSize;
  double blueOriginScale = 1.0;
  Offset blueTransOffset = Offset(0, 0);

  initAnimate() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            print('blueScale.value = ${blueScale.value}');
          });
    blueScale = Tween(begin: 1.0, end: (largeSize / smallSize).toDouble())
        .animate(controller)
          ..addListener(() {
            setState(() {});
          });
    blueTranslate =
        Tween(begin: 0.0, end: 130.toDouble())
            .animate(controller)
              ..addListener(() {
                setState(() {});
              });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: window.physicalSize.width,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Transform.translate(
                  key: _redKey,
                  offset: Offset(0, 0),
                  child: Transform.scale(
                    scale: 1.0,
                    child: Container(
                      color: Colors.red,
                      height: smallSize,
                      width: smallSize,
                    ),
                  ),
                ),
                Transform.translate(
                  key: _greenKey,
                  offset: Offset(0, 0),
                  child: Transform.scale(
                    scale: 1.0,
                    child: Container(
                      color: Colors.green,
                      height: largeSize,
                      width: largeSize,
                    ),
                  ),
                ),
                Transform.translate(
                  key: _blueKey,
                  offset: blueTranslate == null
                      ? Offset(0.0, 0.0)
                      : Offset(-blueTranslate.value, 0),
                  child: Transform.scale(
                    scale: blueScale?.value == null ? 1.0 : blueScale.value,
                    child: Container(
                      color: Colors.blue,
                      height: smallSize,
                      width: smallSize,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.reset();
            controller.forward();
          },
          child: Icon(Icons.home),
        ),
      ),
    );
  }

  getBoxInfo() {
    final RenderBox redBox = _redKey.currentContext.findRenderObject();
    final RenderBox greenBox = _greenKey.currentContext.findRenderObject();
    final RenderBox blueBox = _blueKey.currentContext.findRenderObject();
    print('red: ${redBox.size} - ${redBox.localToGlobal(Offset.zero)}');
    print('green: ${greenBox.size} - ${greenBox.localToGlobal(Offset.zero)}');
    print('blue: ${blueBox.size} - ${blueBox.localToGlobal(Offset.zero)}');
  }
}
