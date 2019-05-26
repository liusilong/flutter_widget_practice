import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

/// https://android.jlelse.eu/flutter-bubble-tab-indicator-for-tabbar-dd038f1076d3
class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicator: CustomTabIndicator(),
            tabs: <Widget>[
              Tab(
                text: "99999999999999999",
              ),
              Tab(
                text: "1111111111111",
              ),
              Tab(
                text: "Kotlin",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text('Page 1'),
            ),
            Center(
              child: Text('Page 2'),
            ),
            Center(
              child: Text('Page 3'),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return CustomPainter(this, onChanged);
  }
}

class CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  final double indicatorHeight = 15.0;
  Paint _paint;

  CustomPainter(this.decoration, VoidCallback onChange)
      : assert(decoration != null),
        super(onChange) {
    _paint = Paint();
    _paint.color = Colors.green;
    _paint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    double cw = configuration.size.width;
    double ch = configuration.size.height;
    double ox = offset.dx;
    double oy = offset.dy;
    // offset is the position from where the decoration should be drawn
    // configuration.size tells us about the height and width of the tab
    final Rect rect = Offset(ox, oy + 5) & Size(cw, ch - 10);
//    final Rect rect1 = offset & configuration.size;
    print(
        'offset => ${offset.dx} = ${offset.dy}, configuration.size => ${configuration.size}');
//    final Rect rect = Offset(offset.dx, (configuration.size.height/2) - indicatorHeight/2) & Size(configuration.size.width, 20);
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(20.0)), _paint);
  }
}
