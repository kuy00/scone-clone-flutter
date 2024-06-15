import 'package:flutter/material.dart';
import 'package:flutter_study/enum/date_picker_select_mode.dart';
import 'package:flutter_study/widget/add_plan/date_select_field_widget.dart';
import 'package:flutter_study/widget/add_plan/app_bar_widget.dart';
import 'package:flutter_study/widget/date_picker/date_picker_widget.dart';
import 'package:flutter_study/widget/text_field_widget.dart';
import 'package:go_router/go_router.dart';

class AddPlanPage extends StatelessWidget {
  const AddPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   Duration.zero,
    //   () => Future.delayed(
    //     const Duration(milliseconds: 500),
    //     () => _bottomSheet(context),
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '플랜 기간과 예산을\n입력하세요',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const DateSelectFieldWidget(),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const TextFieldWidget(
                prefix: Row(
                  children: [
                    Icon(
                      Icons.monetization_on_sharp,
                      color: Color(0xFFC4C4C4),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                inputDecoration: InputDecoration(
                  hintText: '예산',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          child: ElevatedButton(
            onPressed: () => context.pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1773FC),
              minimumSize: const Size(100, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              '저장',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _bottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: false,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return DatePickerWidget(
          width: 1,
          height: 0.8,
          mode: DatePickerSelectMode.normal,
          firstDay: DateTime(DateTime.now().year - 1, 1, 1),
          lastDay: DateTime(DateTime.now().year + 1, 12, 31),
          header: const Text(
            '날짜 선택',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
