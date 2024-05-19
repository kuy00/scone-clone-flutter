import 'package:flutter/material.dart';
import 'package:flutter_study/utils/datetime_util.dart';
import 'package:flutter_study/view_model/date_picker_view_model.dart';
import 'package:flutter_study/widget/date_picker/calendar_date_cell_widget.dart';
import 'package:provider/provider.dart';

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
          ...context.read<DatePickerViewModel>().getMonth(date).map(
                (week) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: week.map((date) {
                      return date != null
                          ? CalendarDateCell(
                              date: date,
                            )
                          : const Expanded(
                              child: SizedBox(),
                            );
                    }).toList(),
                  ),
                ),
              )
        ],
      ),
    );
  }
}
