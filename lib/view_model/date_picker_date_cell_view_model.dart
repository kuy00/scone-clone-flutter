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

class DatePickerDateCellViewModel extends ChangeNotifier {
  final List<DateCellViewModel> _selectedDateCellList = [];
  final List<DateCellViewModel> _dateCellList = [];

  List<DateCellViewModel> get dateCellList => _dateCellList;
  List<DateCellViewModel> get selectedDateCellList => _selectedDateCellList;

  void addDateCell(DateCellViewModel viewModel) {
    _dateCellList.add(viewModel);
  }

  void changeDate(DateCellViewModel viewModel) {
    _selectedDateCellList.map((e) => e.changeSelected()).toList();
    _selectedDateCellList.clear();

    viewModel.changeSelected();
    _selectedDateCellList.add(viewModel);
  }
}
