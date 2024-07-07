import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:flutter_study/widget/add_plan/bottom_sheet_date_picker.dart';
import 'package:flutter_study/widget/add_plan/date_select_field_widget.dart';
import 'package:flutter_study/widget/add_plan/app_bar_widget.dart';
import 'package:flutter_study/widget/add_plan/price_text_field_widget.dart';
import 'package:flutter_study/widget/button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddPlanFirstStepPage extends StatelessWidget {
  const AddPlanFirstStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddPlanViewModel(),
      builder: (context, child) {
        // TODO : 위젯이 리빌드 되는 시점마다 호출되는 현상 해결 필요
        // WidgetsBinding.instance
        //     .addPostFrameCallback((timeStamp) => Future.delayed(
        //           Duration.zero,
        //           () => Future.delayed(
        //             const Duration(milliseconds: 300),
        //             () => _bottomSheet(context),
        //           ),
        //         ));

        return Scaffold(
          appBar: AppBarWidget(context),
          body: SingleChildScrollView(
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
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              child: ButtonWidget(
                text: '다음',
                disabled: !context.watch<AddPlanViewModel>().isFirstStepInvalid,
                onPressed: () => context
                    .push('/addPlan/secondStep',
                        extra: context.read<AddPlanViewModel>())
                    .then((value) =>
                        context.read<AddPlanViewModel>().clearSecondPage()),
              ),
            ),
          ),
        );
      },
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
