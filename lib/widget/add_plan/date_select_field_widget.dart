import 'package:flutter/material.dart';
import 'package:flutter_study/enum/date_picker_select_mode.dart';
import 'package:flutter_study/widget/date_picker/date_picker_widget.dart';
import 'package:go_router/go_router.dart';

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
          builder: (_) {
            return DatePickerWidget(
              width: 1,
              height: 0.55,
              mode: DatePickerSelectMode.normal,
              firstDay: DateTime(DateTime.now().year - 1, 1, 1),
              lastDay: DateTime(DateTime.now().year + 1, 12, 31),
              header: const Text(
                '플랜 기간',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              onSelected: (oldDate, newDate) {
                print(newDate);
                context.pop();
              },
            );
          },
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
                const Text(
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
