import 'package:flutter/material.dart';

/// SafeArea 保证 widget 在刘海屏的下面
/// 在不规则的手机屏幕中可以防止 UI 被刘海遮挡
/// 有 top left bottom right 四个参数可以设置
/// 设置某一边是否被遮挡
class SafeAreaDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true, // 默认为 true
        child: Container(
          width: 300,
          height: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}
