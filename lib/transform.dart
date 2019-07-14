/// Date: 2019-07-02 15:13
/// Author: Liusilong
/// Description:
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';

class TransformPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TransformPage> {
  var sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Transform And Rotate"),
        ),
        body: Column(
          children: <Widget>[
            Slider(
              min: 0.0,
              max: window.physicalSize.width,
              value: sliderValue,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              },
            ),
            Flexible(
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Transform.rotate(
                      angle: sliderValue * math.pi / 180.0,
                      child: Container(
                        color: Colors.red,
                        height: 100.0,
                        width: 100.0,
                        child: Center(child: Text("Rotation")),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Center(
                    child: Transform.scale(
                      scale: sliderValue / window.physicalSize.width,
                      child: Container(
                        color: Colors.blue,
                        height: 100.0,
                        width: 100.0,
                        child: Center(child: Text("Scale")),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(sliderValue, 0.0),
                        child: Container(
                          color: Colors.green,
                          height: 100.0,
                          width: 100.0,
                          child: Center(child: Text("Translate")),
                        ),
                      ),
                    ],
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
