import 'package:flutter/material.dart';
import 'package:flutter_study/enum/date_cell_status.dart';

class DateCellViewModel extends ChangeNotifier {
  final DateTime date;
  DateCellStatus _status = DateCellStatus.none;

  DateCellViewModel({required this.date});

  DateCellStatus get status => _status;

  void reset() {
    _status = DateCellStatus.none;
    notifyListeners();
  }

  void changeStatus(DateCellStatus status) {
    _status = status;
    notifyListeners();
  }
}
