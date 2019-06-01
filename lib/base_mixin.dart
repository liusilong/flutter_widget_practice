import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<T extends BasePage> extends State<T>
    with LocalDataMixin {
  String screenName();

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body();
}

/// 应用程序全局的 mixin
mixin LocalDataMixin {
  void saveName(String name) {}

  String getName() => "Liusilong";
}

/// 特定于某一模块的 mixin
mixin ErrorHandlingMix<T extends BasePage> on BaseState<T> {

}

class HomePage extends BasePage {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> with ErrorHandlingMix{
  @override
  Widget body() {
    return Container();
  }

  @override
  String screenName() {
    saveName("Liusilong");
    var name = getName();
    return "Home";
  }
}
