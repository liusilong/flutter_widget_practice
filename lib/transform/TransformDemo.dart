import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: window.physicalSize.width,
          height: window.physicalSize.height,
          color: Colors.black,
          child: Transform(
            transform: Matrix4.skewY(0.1)..rotateZ(-pi / 12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
      ),
    );
  }
}
