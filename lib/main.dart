import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_widget_practice/page_view_demo.dart';
=======
import 'package:flutter/services.dart';
import 'package:flutter_widget_practice/page_view.dart';
import 'package:flutter_widget_practice/path_animation.dart';
import 'package:flutter_widget_practice/physical_logical_pixel.dart';
import 'package:flutter_widget_practice/safe_area.dart';
import 'package:flutter_widget_practice/spacer_demo.dart';
>>>>>>> 0c828ca0e7e776e1b300dc5622b3ca17c4d2bf3d

import 'container_bg.dart';
import 'container_shadow.dart';
import 'dialog_demo.dart';
import 'lifecycle.dart';
import 'line_picture2.dart';
import 'stack_widget.dart';

import 'Align_widget.dart';

import 'custom_tab_indicator.dart';

<<<<<<< HEAD
void main() => runApp(
  MaterialApp(
    home: PageViewDemoPage(),
  )
);
=======
import 'clip_demo.dart';

import 'transform_background.dart';

import 'video_player.dart';

import 'path_demo.dart';

import 'line_picture.dart';

void main() {
  runApp(MaterialApp(
    home: SafeAreaDemo(),
  ));
}
>>>>>>> 0c828ca0e7e776e1b300dc5622b3ca17c4d2bf3d

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
