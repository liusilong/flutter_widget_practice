import 'package:flutter/material.dart';
import 'dart:ui';

/// https://medium.com/flutter-community/paths-in-flutter-a-visual-guide-6c906464dcd0
///

class PathDemo extends StatefulWidget {
  @override
  _PathDemoState createState() => _PathDemoState();
}

class _PathDemoState extends State<PathDemo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  double factor = 0.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    // 非线性动画
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {
          factor = animation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: window.physicalSize.width,
        height: window.physicalSize.height,
        child: CustomPaint(
          painter: PathPainter(factor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}

/// Path 基本上是绘制元素的集合，这些元素是根据起点绘制的(0,0)
class PathPainter extends CustomPainter {
  Paint _paint;
  Path _path;
  final double factor;
  bool isPathPainted = false;

  PathPainter(this.factor) {
    _paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
    _path = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    /// moveTo 是将 Path 的起始点从移动到指定的点
    /// 将 Path 的起始点移至 屏幕中间
//    _path.moveTo(0, size.height / 2);

    /// lineTo 连接至某一点
//    _path.lineTo(size.width, size.height / 2);
//    _path.lineTo(size.width / 2 - 20, size.height / 2 + 40);
//    _path.close();
    /// 二阶贝塞尔 （一个控制点）
//    _path.moveTo(0, size.height / 2);
    // 前两个参数为 控制点，后两个参数为连接点
//    _path.quadraticBezierTo(
//        size.width / 2, size.height, size.width, size.height / 2);

    if (!isPathPainted) {
      isPathPainted = true;

      /// 三阶贝塞尔（两个控制点）
      _path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
          size.height / 4, size.width, size.height);

      /// conicTo: 最后一个参数为 weight
      /// 如果 weight > 1 绘制双曲线
      /// 如果 weight = 1 绘制抛物线
      /// 如果 weight < 1 绘制椭圆
//       _path.conicTo(size.width / 4, 3 * size.height / 4, size.width, size.height, 1);

      _paint.color = Colors.red;
      canvas.drawPath(_path, _paint);
    }
    PathMetric pathMetric = _path.computeMetrics().single;
    print('path length is ${pathMetric.length}');
    Tangent t = pathMetric.getTangentForOffset(pathMetric.length * factor);
    print('offset is ${t.position.dx}; ${t.position.dy}');
    _paint.color = Colors.orange;
    canvas.drawCircle(Offset(t.position.dx, t.position.dy), 10, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
