import 'dart:ui';

import 'package:flutter/material.dart';

class PathAnimationDemo extends StatefulWidget {
  @override
  _PathAnimationDemoState createState() => _PathAnimationDemoState();
}

class _PathAnimationDemoState extends State<PathAnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: window.physicalSize.width,
        height: window.physicalSize.height,
        child: CustomPaint(
          painter: PathPainter(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  Path _path;
  Paint _paint;

  PathPainter() {
    _path = Path();
    _paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
        size.height / 4, size.width, size.height);
    // single 表示取出 Metrics 中的第一个轮廓
    PathMetric pathMetric = _path.computeMetrics().single;
    pathMetric.getTangentForOffset(pathMetric.length);

    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
