import 'package:flutter/widgets.dart';

class AppState with ChangeNotifier {
  AppState();

  String _displayText = "";

  void setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }

  String get getDisplayText => _displayText;
}
