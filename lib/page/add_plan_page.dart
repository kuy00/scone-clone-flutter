import 'package:flutter/material.dart';
import 'package:flutter_study/enum/date_picker_select_mode.dart';
import 'package:flutter_study/widget/add_plan/app_bar_widget.dart';
import 'package:flutter_study/widget/date_picker/date_picker_widget.dart';

class AddPlanPage extends StatelessWidget {
  const AddPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration.zero,
        () => Future.delayed(
            const Duration(milliseconds: 500), () => _bottomSheet(context)));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(context),
      body: Text('add plan'),
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
