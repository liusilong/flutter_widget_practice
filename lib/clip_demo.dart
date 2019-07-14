import 'package:flutter/material.dart';

/// https://medium.com/flutter-community/clipping-in-flutter-e9eaa6b1721a

class ClipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var map = {"a": "A", "b": "B", "c": "C", "d": "D"};
    var list = [
      1,
      2,
      "d",
      {"name": "Liusilong"}
    ];

    return Scaffold(
      body: _customClip(),
    );
  }
}

/// 创建一个圆形，如果长宽不一样，则为椭圆
Widget _clipOvalWidget() {
  return Center(
    child: ClipOval(
      child: Container(
        width: 100,
        height: 200,
        color: Colors.red,
      ),
    ),
  );
}

Widget _customClip() {
  return Center(
    child: ClipPath(
      clipper: MyClipPath2(),
      child: Container(
        width: 200,
        height: 100,
        color: Colors.red,
        child: Center(
          child: Text(
            'Liusilong',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}

/// 自定义一个 clip ，自己决定大小和位置，CustomClip 干的就是这事
/// 注意：继承 CustomClipper 的时候指定泛型很重要，因为 getClip 这个方法
/// 会根据指定的泛型类型返回对象
/// 如：下面的例子中指定的是泛型类型为 Rect ，则 getClip 方法返回的就是 Rect 对象
class CustomRect extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

/// 自定义一个 Clip Path

class MyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

/// 自定义一个 Clip Path 2 一个 Ticket 的 Clip
///
class MyClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // left oval
    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: 10));
    // right oval
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: 10));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
