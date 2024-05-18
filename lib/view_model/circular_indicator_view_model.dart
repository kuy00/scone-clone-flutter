import 'package:flutter/material.dart';

class CircularIndicatorViewModel extends ChangeNotifier {
  bool _isPressed = false;
  bool get isPressed => _isPressed;

  void setIsPressed(flag) {
    _isPressed = flag;
    notifyListeners();
  }
}
