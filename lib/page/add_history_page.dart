import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_history_view_model.dart';
import 'package:flutter_study/widget/add_history/app_bar_widget.dart';
import 'package:flutter_study/widget/add_history/content_text_field_widget.dart';
import 'package:flutter_study/widget/add_history/date_select_field_widget.dart';
import 'package:flutter_study/widget/add_history/plan_history_badge.dart';
import 'package:flutter_study/widget/add_history/plan_history_type_button_widget.dart';
import 'package:flutter_study/widget/add_history/price_text_field_widget.dart';
import 'package:flutter_study/widget/button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddHistoryPage extends StatelessWidget {
  final int planId;

  const AddHistoryPage({super.key, required this.planId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        AddHistoryViewModel viewModel = AddHistoryViewModel(planId);
        viewModel.init();
        return viewModel;
      },
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarWidget(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const PlanHistoryTypeButtonWidget(),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const PriceTextFieldWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const ContentTextFieldWidget(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const DateSelectFieldWidget(),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  '최근',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<AddHistoryViewModel>(
                  builder: (_, addHistoryViewModel, __) => Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    spacing: 15,
                    runSpacing: 10,
                    children: addHistoryViewModel.planHistories
                        .map(
                          (planHistory) => GestureDetector(
                            onTap: () => context
                                .read<AddHistoryViewModel>()
                                .setHistoryData(planHistory),
                            child: PlanHistoryBadge(planHistory: planHistory),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              child: ButtonWidget(
                text: '저장',
                disabled: context
                    .read<AddHistoryViewModel>()
                    .priceTextController
                    .text
                    .isEmpty,
                onPressed: () => context.pop(
                    context.read<AddHistoryViewModel>().toPlanHistoryEntity),
              ),
            ),
          ),
        );
      },
    );
  }
}
