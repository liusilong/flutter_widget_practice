import 'package:flutter/material.dart';
import 'dart:ui';

class AlignWidget extends StatelessWidget {
  const AlignWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Container(
      width: window.physicalSize.width,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text("liusilong"),
      ),
    ));
  }

  _buildLine() {
    return Container(
      width: 2,
      height: 500,
      color: Colors.black,
    );
  }
}
