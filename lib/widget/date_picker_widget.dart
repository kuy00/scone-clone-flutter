import 'package:flutter/material.dart';
import 'package:flutter_study/enums/date_picker_select_mode.dart';
import 'package:flutter_study/utils/datetime_util.dart';
import 'package:flutter_study/view_model/date_picker_view_model.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DatePickerWidget extends StatelessWidget {
  final DatePickerSelectMode mode;
  final DateTime firstDay;
  final DateTime lastDay;
  final Widget? header;
  final double? width;
  final double? height;
  final DateTime? initSelectDate;
  final Function? onSelected;

  const DatePickerWidget(
      {super.key,
      required this.mode,
      required this.firstDay,
      required this.lastDay,
      this.header,
      this.width,
      this.height,
      this.initSelectDate,
      this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatePickerViewModel>(
      create: (_) => DatePickerViewModel(
          initSelectDate: initSelectDate, onSelected: onSelected),
      builder: (context, child) {
        return FractionallySizedBox(
          widthFactor: width,
          heightFactor: height,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 14, right: 14),
            child: Column(
              children: [
                header ?? const SizedBox(),
                Expanded(
                  child: Scrollbar(
                    thickness: 0,
                    child: ScrollablePositionedList.builder(
                      initialScrollIndex: dateDiff(
                              context.watch<DatePickerViewModel>().currentDate,
                              firstDay,
                              unit: Unit.month)
                          .toInt(),
                      itemCount: dateDiff(lastDay, firstDay, unit: Unit.month)
                              .toInt() +
                          1,
                      itemScrollController:
                          context.read<DatePickerViewModel>().scrollController,
                      itemBuilder: (_, index) => CalendarPageWidget(
                          date: dateAdd(firstDay, months: index)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CalendarPageWidget extends StatelessWidget {
  final DateTime date;

  const CalendarPageWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              dateFormat(date, 'y MMM'),
              style: const TextStyle(fontSize: 17),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4, bottom: 8),
            child: Row(
              children: context
                  .read<DatePickerViewModel>()
                  .header
                  .map(
                    (header) => Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          header,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          ...context
              .read<DatePickerViewModel>()
              .getMonth(date)
              .map((week) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: week.map((date) {
                        return CalendarDateCell(date: date);
                      }).toList(),
                    ),
                  ))
        ],
      ),
    );
  }
}

class CalendarDateCell extends StatelessWidget {
  final DateTime? date;

  const CalendarDateCell({super.key, this.date});

  @override
  Widget build(BuildContext context) {
    BoxDecoration? innerContainerStyle;
    TextStyle? textStyle;

    if (date != null) {
      if (isSameDate(context.watch<DatePickerViewModel>().currentDate, date!)) {
        innerContainerStyle = const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        );
        textStyle = const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );
      } else if (isToday(date!)) {
        textStyle = const TextStyle(
          color: Color(0xFF1871FF),
          fontWeight: FontWeight.bold,
        );
      }
    }

    return Expanded(
      child: Container(
        child: GestureDetector(
          onTap: date != null ? () => _onTap(context, date!) : null,
          child: Container(
            padding: const EdgeInsets.all(6),
            alignment: Alignment.center,
            decoration: innerContainerStyle,
            child: Text(
              date?.day.toString() ?? '',
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}

void _onTap(BuildContext context, DateTime date) {
  context
      .read<DatePickerViewModel>()
      .onSelected
      ?.call(context.read<DatePickerViewModel>().currentDate, date);

  context.read<DatePickerViewModel>().setCurrentDate(date);
}
