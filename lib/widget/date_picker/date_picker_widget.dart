import 'package:flutter/material.dart';
import 'package:flutter_study/enum/date_picker_select_mode.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:flutter_study/view_model/date_picker_view_model.dart';
import 'package:flutter_study/widget/date_picker/calendar_page_widget.dart';
import 'package:flutter_study/widget/date_picker/date_range_badge_widget.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DatePickerWidget extends StatelessWidget {
  final DatePickerSelectMode mode;
  final DateTime firstDay;
  final DateTime lastDay;
  final WidgetBuilder? header;
  final WidgetBuilder? bottom;
  final double? width;
  final double? height;
  final DateTime? initSelectDate;
  final Function? onSelected;
  final List<String>? dateRange;

  const DatePickerWidget(
      {super.key,
      required this.mode,
      required this.firstDay,
      required this.lastDay,
      this.header,
      this.bottom,
      this.width,
      this.height,
      this.initSelectDate,
      this.onSelected,
      this.dateRange});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DatePickerViewModel(
        mode: mode,
        firstDay: firstDay,
        lastDay: lastDay,
        initSelectDate: initSelectDate,
        onSelected: onSelected,
        dateRange: dateRange,
      ),
      builder: (context, child) {
        return FractionallySizedBox(
          widthFactor: width,
          heightFactor: height,
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              if (header != null) header!(context),
              Expanded(
                child: Scrollbar(
                  thickness: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: ScrollablePositionedList.builder(
                      initialScrollIndex: dateDiff(
                              context
                                      .read<DatePickerViewModel>()
                                      .initSelectDate ??
                                  DateTime.now(),
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
              ),
              Consumer<DatePickerViewModel>(
                builder: (_, datePickerViewModel, __) =>
                    datePickerViewModel.dateRange != null &&
                            datePickerViewModel.selectedDateCellList.isNotEmpty
                        ? Container(
                            height: 45,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 1,
                                  color: Color(0xFFD7D7D7),
                                ),
                              ),
                            ),
                            child: Row(
                              children: datePickerViewModel.dateRange!
                                  .expand((e) => [
                                        DateRangeBadgeWidget(title: e),
                                        const SizedBox(
                                          width: 10,
                                        )
                                      ])
                                  .toList(),
                            ),
                          )
                        : const SizedBox(),
              ),
              if (bottom != null) bottom!(context),
            ],
          ),
        );
      },
    );
  }
}
