import 'package:flutter/material.dart';
import 'dart:ui';

class StackWidget extends StatelessWidget {
  const StackWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Container(
          width: window.physicalSize.width,
          height: 42,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                top: null,
                child: Container(
                  width: window.physicalSize.width,
                  height: 2,
                  color: Colors.red,
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: window.physicalSize.width,
                  height: 40,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
