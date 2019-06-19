import 'package:flutter/material.dart';

class TransformBackground extends StatefulWidget {
  @override
  _TransformBackgroundState createState() => _TransformBackgroundState();
}

class _TransformBackgroundState extends State<TransformBackground> {
  double foo = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (d) {
          if (d.primaryDelta >= 1.0 || d.primaryDelta <= -1.0) {
            setState(() {
              foo += d.primaryDelta;
            });
          }
        },
        child: Container(
          child: Transform.translate(
            offset: Offset(foo, 0.0),
            child: Image.asset('assets/sun.jpg', fit: BoxFit.fitWidth,),
          ),
        ),
      ),
    );
  }
}
