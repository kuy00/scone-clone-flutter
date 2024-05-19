import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_history_view_model.dart';
import 'package:flutter_study/widget/add_history/app_bar_widget.dart';
import 'package:flutter_study/widget/add_history/content_text_field_widget.dart';
import 'package:flutter_study/widget/add_history/date_select_field_widget.dart';
import 'package:flutter_study/widget/add_history/plan_history_type_button_widget.dart';
import 'package:flutter_study/widget/add_history/price_text_field_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddHistoryPage extends StatelessWidget {
  final String planId;

  const AddHistoryPage({super.key, required this.planId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddHistoryViewModel(planId),
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBarWidget(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
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
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              child: ElevatedButton(
                onPressed: () => context.pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1773FC),
                  minimumSize: const Size(100, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
      },
    );
  }
}
