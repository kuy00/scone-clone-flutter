import 'package:flutter/material.dart';
import 'package:flutter_study/enum/plan_type.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:flutter_study/widget/add_plan/bottom_sheet_date_picker.dart';
import 'package:flutter_study/widget/add_plan/date_select_field_widget.dart';
import 'package:flutter_study/widget/add_plan/app_bar_widget.dart';
import 'package:flutter_study/widget/add_plan/description_text_field_widget.dart';
import 'package:flutter_study/widget/add_plan/plan_name_text_field_widget.dart';
import 'package:flutter_study/widget/add_plan/price_text_field_widget.dart';
import 'package:flutter_study/widget/button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddPlanFirstStepPage extends StatelessWidget {
  final PlanType planType;

  const AddPlanFirstStepPage({super.key, required this.planType});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return AddPlanViewModel(planType);
      },
      builder: (context, child) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (context.read<AddPlanViewModel>().isFirst) {
            Future.delayed(
              const Duration(milliseconds: 300),
              () => _bottomSheet(context),
            );
            context.read<AddPlanViewModel>().setIsFirst();
          }
        });

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarWidget(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Visibility(
                  visible: planType == PlanType.plan,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '플랜 기간과 예산을\n입력하세요',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const DateSelectFieldWidget(),
                      const SizedBox(height: 10),
                      const PriceTextFieldWidget(),
                      const SizedBox(height: 4),
                      Consumer<AddPlanViewModel>(
                        builder: (_, addPlanViewModel, __) => Visibility(
                          visible: addPlanViewModel.displayPrice != '',
                          child: Row(
                            children: [
                              const SizedBox(width: 44),
                              Text(
                                '${addPlanViewModel.displayPrice} 원',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: planType == PlanType.free,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '플랜 기간과 이름을\n입력하세요',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      DateSelectFieldWidget(),
                      SizedBox(height: 10),
                      PlanNameTextFieldWidget(),
                      SizedBox(height: 10),
                      DescriptionTextFieldWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Consumer<AddPlanViewModel>(
            builder: (_, addPlanViewModel, __) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                child: ButtonWidget(
                  text: '다음',
                  disabled: !addPlanViewModel.isFirstStepInvalid,
                  onPressed: () {
                    if (planType == PlanType.plan) {
                      context
                          .push('/addPlan/secondStep', extra: addPlanViewModel)
                          .then((value) => addPlanViewModel.clearSecondPage());
                    } else if (planType == PlanType.free) {
                      context.push('/addPlan/complete',
                          extra: addPlanViewModel);
                    }
                  },
                ),
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
