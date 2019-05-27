import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'stack_widget.dart';

import 'Align_widget.dart';

import 'custom_tab_indicator.dart';

import 'clip_demo.dart';

import 'transform_background.dart';

import 'video_player.dart';

import 'path_demo.dart';

import 'line_picture.dart';

void main() {
  runApp(MaterialApp(
    home: LinePicture(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
