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
              Tab(text: "Tab 1",),
              Tab(text: "Tab 2",),
              Tab(text: "Tab 3",)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text('Page 1'),),
            Center(child: Text('Page 2'),),
            Center(child: Text('Page 3'),)
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

    // offset is the position from where the decoration should be drawn
    // configuration.size tells us about the height and width of the tab
    final Rect rect = Offset(offset.dx, (configuration.size.height/2) - indicatorHeight/2) & Size(configuration.size.width, indicatorHeight);
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(10.0)), _paint);
  }
}
