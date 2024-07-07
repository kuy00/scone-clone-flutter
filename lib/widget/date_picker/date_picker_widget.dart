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
  final List<DateTime>? initDate;
  final Function? onSelected;
  final bool showDateRangeButton;

  const DatePickerWidget(
      {super.key,
      required this.mode,
      required this.firstDay,
      required this.lastDay,
      this.header,
      this.bottom,
      this.width,
      this.height,
      this.initDate,
      this.onSelected,
      this.showDateRangeButton = false});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DatePickerViewModel(
        mode: mode,
        firstDay: firstDay,
        lastDay: lastDay,
        initDate: initDate,
        onSelected: onSelected,
      ),
      builder: (context, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<DatePickerViewModel>().selectedInitDate();
        });

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
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: ScrollablePositionedList.builder(
                      initialScrollIndex: dateDiff(
                              firstDay,
                              context
                                      .read<DatePickerViewModel>()
                                      .initDate
                                      ?.first ??
                                  DateTime.now(),
                              unit: Unit.month)
                          .toInt(),
                      itemCount: dateDiff(firstDay, lastDay, unit: Unit.month)
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
                builder: (_, datePickerViewModel, __) => showDateRangeButton &&
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
                          children: datePickerViewModel.dateRangeButton
                              .expand((e) => [
                                    DateRangeBadgeWidget(
                                      title: e,
                                      onTap: () => datePickerViewModel
                                          .onTapDateRangeBadge(e),
                                    ),
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
