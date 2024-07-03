import 'package:flutter/material.dart';
import 'package:flutter_study/enum/date_cell_status.dart';
import 'package:flutter_study/enum/date_picker_select_mode.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:flutter_study/view_model/date_picker_date_cell_view_model.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DatePickerViewModel extends ChangeNotifier {
  final DatePickerSelectMode mode;
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime? initSelectDate;
  final Function? onSelected;
  final List<String> _header = ['일', '월', '화', '수', '목', '금', '토'];
  final List<String> dateRangeButton = ['1주', '2주', '한 달'];
  final ItemScrollController _scrollController = ItemScrollController();
  final List<DateCellViewModel> _selectedDateCellList = [];
  final List<DateCellViewModel> _dateCellList = [];

  DatePickerViewModel(
      {required this.mode,
      required this.firstDay,
      required this.lastDay,
      this.initSelectDate,
      this.onSelected});

  List<String> get header => _header;
  ItemScrollController get scrollController => _scrollController;
  List<DateCellViewModel> get selectedDateCellList => _selectedDateCellList;

  void addDateCell(DateCellViewModel viewModel) {
    _dateCellList.add(viewModel);
  }

  void selectedDate(DateCellViewModel viewModel) {
    /* 
      선택된 일자 초기화 기준
      1. DatePicker 일반 선택 모드
      2. DatePicker 범위 선택 모드, 선택된 날짜가 1개 초과
      3. 기존 선택된 일자가 같은 일자가 아니면서, 기존 선택된 일자보다 이전 일자를 선택한 경우
     */
    if (mode == DatePickerSelectMode.normal ||
        (mode == DatePickerSelectMode.range &&
            _selectedDateCellList.length > 1) ||
        (_selectedDateCellList.isNotEmpty &&
            !isSameDate(viewModel.date, _selectedDateCellList[0].date) &&
            isAfter(selectedDateCellList.first.date, viewModel.date))) {
      _selectedDateCellList.map((e) => e.reset()).toList();
      _selectedDateCellList.clear();
    }

    viewModel.changeStatus(DateCellStatus.selected);
    _selectedDateCellList.add(viewModel);

    // DatePicker 범위 선택
    if (mode == DatePickerSelectMode.range &&
        _selectedDateCellList.length > 1) {
      if (_selectedDateCellList[0].date != _selectedDateCellList[1].date) {
        int startCellIndex = getIndexByDateCell(_selectedDateCellList[0]) + 1;
        int endCellIndex = getIndexByDateCell(_selectedDateCellList[1]);

        // Date Cell 상태 변경
        _selectedDateCellList.first.changeStatus(DateCellStatus.startDate);
        _selectedDateCellList.last.changeStatus(DateCellStatus.endDate);

        // 선택된 일자 사이의 일자 추출
        List<DateCellViewModel> includedDate = [];

        for (int i = startCellIndex; i < endCellIndex; i++) {
          _dateCellList[i].changeStatus(DateCellStatus.includeDate);
          includedDate.add(_dateCellList[i]);
        }

        // 선택 일자 리스트에 추가
        _selectedDateCellList.insertAll(1, includedDate);
      }
    }

    notifyListeners();
  }

  int getIndexByDateCell(DateCellViewModel dateCell) {
    return _dateCellList.indexWhere((element) => element.date == dateCell.date);
  }

  List<List<DateTime?>> getMonth(DateTime date) {
    List<List<DateTime?>> month = [];
    int lastDay = DateTime(date.year, date.month + 1, 0).day;
    int firstDayOfWeek = _header.indexOf(DateFormat('E').format(date));

    List<DateTime?> week = [];

    for (int i = 0; i < lastDay; i++) {
      if (i == 0) {
        week.insertAll(i, List.filled(firstDayOfWeek, null));
      }

      week.add(DateTime(date.year, date.month, i + 1));

      if (week.length == 7) {
        month.add(week);
        week = [];
      }
    }

    if (week.isNotEmpty) {
      week.addAll(List.filled(7 - week.length, null));
      month.add(week);
    }

    return month;
  }

  void onTapDateRangeBadge(String dateRange) {
    int startDateIndex = getIndexByDateCell(selectedDateCellList[0]);

    if (selectedDateCellList.length > 1) {
      selectedDate(selectedDateCellList[0]);
    }

    switch (dateRange) {
      case '1주':
        selectedDate(_dateCellList[startDateIndex + 6]);
        break;
      case '2주':
        selectedDate(_dateCellList[startDateIndex + 13]);
        break;
      case '한 달':
        selectedDate(_dateCellList[startDateIndex + 30]);
        break;
    }
  }

  void changeScroll(DateTime date) {
    scrollController.scrollTo(
        index: dateDiff(date, firstDay, unit: Unit.month).toInt(),
        duration: const Duration(seconds: 1));
  }
}
