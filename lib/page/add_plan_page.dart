import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:flutter_study/widget/add_plan/bottom_sheet_date_picker.dart';
import 'package:flutter_study/widget/add_plan/date_select_field_widget.dart';
import 'package:flutter_study/widget/add_plan/app_bar_widget.dart';
import 'package:flutter_study/widget/add_plan/price_text_field_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddPlanPage extends StatelessWidget {
  const AddPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context),
      body: ChangeNotifierProvider(
        create: (_) => AddPlanViewModel(),
        builder: (context, child) {
          WidgetsBinding.instance
              .addPostFrameCallback((timeStamp) => Future.delayed(
                    Duration.zero,
                    () => Future.delayed(
                      const Duration(milliseconds: 300),
                      () => _bottomSheet(context),
                    ),
                  ));

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                const PriceTextFieldWidget(),
                const SizedBox(height: 4),
                if (context.watch<AddPlanViewModel>().displayPrice != '')
                  Row(
                    children: [
                      const SizedBox(width: 44),
                      Text(
                        '${context.watch<AddPlanViewModel>().displayPrice} 원',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
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
              '다음',
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
      builder: (_) => ChangeNotifierProvider<AddPlanViewModel>.value(
        value: context.read<AddPlanViewModel>(),
        child: const BottomSheetDatePicker(),
      ),
    );
  }
}
