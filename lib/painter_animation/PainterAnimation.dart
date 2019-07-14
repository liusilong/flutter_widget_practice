import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// https://www.youtube.com/watch?v=tRe8teyf9Nk

class PainterAnimate extends StatefulWidget {
  PainterAnimate({Key key}) : super(key: key);

  _PainterAnimateState createState() => _PainterAnimateState();
}

class _PainterAnimateState extends State<PainterAnimate>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  PageController pageController = PageController(keepPage: true);

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMilliseconds}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<String>.generate(10, (int index){
      return 'item $index';
    });

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return CustomPaint(
                              painter: TimerPainter(
                                  animation: controller,
                                  backgroundColor: Colors.white,
                                  color: Colors.pink),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.center,
              child: Column(
                children: <Widget>[
                  Text(
                    'Count Down',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor, color;
  Paint timePaint;
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation) {
    timePaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, timePaint);
    timePaint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(
        Offset.zero & size, math.pi * 1.5, -progress, false, timePaint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
