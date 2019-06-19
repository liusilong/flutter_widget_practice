import 'package:flutter/material.dart';

/// 使用 decoration 来设置 Container 的背景
class ContainerBackgroundWithImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/sun.jpg'), fit: BoxFit.cover)),
      ),
    );
  }
}
