import 'package:flutter/material.dart';
import 'dart:ui';

/// https://medium.com/flutter-community/paths-in-flutter-a-visual-guide-6c906464dcd0
///
class PathDemo extends StatelessWidget {
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
    );
  }
}

/// Path 基本上是绘制元素的集合，这些元素是根据起点绘制的(0,0)
class PathPainter extends CustomPainter {
  Paint _paint;
  Path _path;

  PathPainter() {
    _paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
    _path = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    print('$size');

    /// moveTo 是将 Path 的起始点从移动到指定的点
    /// 将 Path 的起始点移至 屏幕中间
    _path.moveTo(0, size.height / 2);

    /// lineTo 连接至某一点
    _path.lineTo(size.width, size.height / 2);
//    _path.lineTo(size.width / 2 - 20, size.height / 2 + 40);
//    _path.close();
    /// 二阶贝塞尔 （一个控制点）
//    _path.moveTo(0, size.height / 2);
    // 前两个参数为 控制点，后两个参数为连接点
//    _path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height / 2 );

    /// 三阶贝塞尔（两个控制点）
//    _path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
//        size.height / 4, size.width, size.height);
    /// conicTo: 最后一个参数为 weight
    /// 如果 weight > 1 绘制双曲线
    /// 如果 weight = 1 绘制抛物线
    /// 如果 weight < 1 绘制椭圆
    // _path.conicTo(size.width / 4, 3 * size.height / 4, size.width, size.height, 1);

    PathMetrics pathMetrics = _path.computeMetrics();
    Offset position = pathMetrics.single.getTangentForOffset(10).position;
    print('$position');
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
