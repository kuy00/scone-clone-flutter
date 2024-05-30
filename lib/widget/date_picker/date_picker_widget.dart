import 'package:flutter/material.dart';
import 'package:flutter_study/enum/date_picker_select_mode.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:flutter_study/view_model/date_picker_view_model.dart';
import 'package:flutter_study/widget/date_picker/calendar_page_widget.dart';
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
    return ChangeNotifierProvider(
      create: (_) => DatePickerViewModel(
        firstDay: firstDay,
        lastDay: lastDay,
        initSelectDate: initSelectDate,
        onSelected: onSelected,
      ),
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
                              context
                                  .read<DatePickerViewModel>()
                                  .initSelectDate,
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
