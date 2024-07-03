import 'package:flutter/material.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:flutter_study/widget/add_plan/bottom_sheet_date_picker.dart';
import 'package:provider/provider.dart';

class DateSelectFieldWidget extends StatelessWidget {
  const DateSelectFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          showDragHandle: false,
          isScrollControlled: true,
          context: context,
          builder: (_) => ChangeNotifierProvider<AddPlanViewModel>.value(
            value: context.watch<AddPlanViewModel>(),
            child: const BottomSheetDatePicker(),
          ),
        );
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: const Icon(
                    Icons.calendar_month,
                    color: Color(0xFFC4C4C4),
                  ),
                ),
                context.watch<AddPlanViewModel>().selectedDate != null
                    ? Text(
                        '${dateFormat(context.watch<AddPlanViewModel>().selectedDate!.first, 'MMM dd일')} ~ ${dateFormat(context.watch<AddPlanViewModel>().selectedDate!.last, 'MMM dd일')}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        '기간',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
