import 'package:flutter/material.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:flutter_study/view_model/date_picker_date_cell_view_model.dart';
import 'package:flutter_study/view_model/date_picker_view_model.dart';
import 'package:provider/provider.dart';

class CalendarDateCell extends StatelessWidget {
  final DateTime date;

  const CalendarDateCell({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DateCellViewModel>(
      create: (_) {
        DateCellViewModel viewModel = DateCellViewModel(date: date);
        context.read<DatePickerViewModel>().addDateCell(viewModel);

        if (isSameDate(
            context.read<DatePickerViewModel>().initSelectDate, date)) {
          context.read<DatePickerViewModel>().changeDate(viewModel);
        }

        return viewModel;
      },
      builder: (context, child) {
        return Expanded(
          child: Container(
            child: GestureDetector(
              onTap: () => _onTap(context, date),
              child: Container(
                padding: const EdgeInsets.all(6),
                alignment: Alignment.center,
                decoration: context.watch<DateCellViewModel>().isSelected
                    ? const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      )
                    : null,
                child: Text(
                  date.day.toString(),
                  style: context.watch<DateCellViewModel>().isSelected
                      ? const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      : isToday(date)
                          ? const TextStyle(
                              color: Color(0xFF1871FF),
                              fontWeight: FontWeight.bold,
                            )
                          : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

void _onTap(BuildContext context, DateTime date) {
  context.read<DatePickerViewModel>().onSelected?.call(
      context.read<DatePickerViewModel>().selectedDateCellList[0].date, date);
  context
      .read<DatePickerViewModel>()
      .changeDate(context.read<DateCellViewModel>());
}
