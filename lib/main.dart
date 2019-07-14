import 'package:flutter/material.dart';
import 'package:flutter_widget_practice/page_view_demo.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_practice/get_it/get_it_demo.dart';
import 'package:flutter_widget_practice/get_it/locator.dart';
import 'package:flutter_widget_practice/page_view.dart';
import 'package:flutter_widget_practice/painter_animation/PainterAnimation.dart';
import 'package:flutter_widget_practice/pageview/pageview_zoom_transition.dart';
import 'package:flutter_widget_practice/path_animation.dart';
import 'package:flutter_widget_practice/physical_logical_pixel.dart';
import 'package:flutter_widget_practice/provider/changenotifier/change_notifier_demo.dart';
import 'package:flutter_widget_practice/provider/local_refresh.dart';
import 'package:flutter_widget_practice/provider/provider_basic.dart';
import 'package:flutter_widget_practice/provider/provider_demo_new.dart';
import 'package:flutter_widget_practice/router/router_demo.dart';
import 'package:flutter_widget_practice/safe_area.dart';
import 'package:flutter_widget_practice/scroll_view_and_page_view.dart';
import 'package:flutter_widget_practice/spacer_demo.dart';
import 'package:flutter_widget_practice/transform.dart';
import 'package:flutter_widget_practice/transform/TransformDemo.dart';
import 'package:flutter_widget_practice/tutorial_coach_mark_page.dart';
import 'package:flutter_widget_practice/video/video_page.dart';

import 'aspect_ratio_demo.dart';
import 'clip_path/clip_new_demo.dart';
import 'clip_path/clip_path_guide.dart';
import 'container_bg.dart';
import 'container_shadow.dart';
import 'dialog_demo.dart';
import 'dots_indicator.dart';
import 'english_teacher.dart';
import 'ipad_iphone_deteced/tablet_deteced.dart';
import 'lifecycle.dart';
import 'line_picture2.dart';
import 'stack_widget.dart';

import 'Align_widget.dart';

import 'custom_tab_indicator.dart';

// https://1254467417.vod2.myqcloud.com/2f4e0c50vodtransgzp1254467417/e27029ba5285890790483308598/v.f32849.m3u8

String videoUrl =
    "https://1254467417.vod2.myqcloud.com/7b2669a8vodgzp1254467417/4aef011e5285890790854956573/b665d848c8fd99af217c6ce4.mp4";

void main() => runApp(LocalRefreshPage());

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
