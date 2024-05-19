import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DatePickerViewModel extends ChangeNotifier {
  final DateTime firstDay;
  final DateTime lastDay;
  DateTime initSelectDate;
  final Function? onSelected;
  final List<String> _header = ['일', '월', '화', '수', '목', '금', '토'];
  final ItemScrollController _scrollController = ItemScrollController();

  DatePickerViewModel(
      {required this.firstDay,
      required this.lastDay,
      DateTime? initSelectDate,
      this.onSelected})
      : initSelectDate = initSelectDate ?? DateTime.now();

  List<String> get header => _header;
  ItemScrollController get scrollController => _scrollController;

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
}
