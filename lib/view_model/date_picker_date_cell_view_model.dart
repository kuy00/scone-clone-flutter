import 'package:flutter/material.dart';

class DateCellViewModel extends ChangeNotifier {
  final DateTime date;
  bool _isSelected = false;

  DateCellViewModel({required this.date});

  bool get isSelected => _isSelected;

  void changeSelected() {
    _isSelected = !_isSelected;
    notifyListeners();
  }
}
