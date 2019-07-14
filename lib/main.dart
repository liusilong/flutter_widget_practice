import 'package:flutter/material.dart';
import 'package:flutter_widget_practice/page_view_demo.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_practice/page_view.dart';
import 'package:flutter_widget_practice/painter_animation/PainterAnimation.dart';
import 'package:flutter_widget_practice/path_animation.dart';
import 'package:flutter_widget_practice/physical_logical_pixel.dart';
import 'package:flutter_widget_practice/safe_area.dart';
import 'package:flutter_widget_practice/spacer_demo.dart';

import 'container_bg.dart';
import 'container_shadow.dart';
import 'dialog_demo.dart';
import 'lifecycle.dart';
import 'line_picture2.dart';
import 'stack_widget.dart';

import 'Align_widget.dart';

import 'custom_tab_indicator.dart';

void main() => runApp(MaterialApp(
      home: PainterAnimate(),
    ));

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


