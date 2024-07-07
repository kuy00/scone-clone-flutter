import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:flutter_study/widget/add_plan/app_bar_widget.dart';
import 'package:flutter_study/widget/add_plan/description_text_field_widget.dart';
import 'package:flutter_study/widget/add_plan/plan_name_text_field_widget.dart';
import 'package:flutter_study/widget/button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddPlanSecondStepPage extends StatelessWidget {
  final AddPlanViewModel viewModel;

  const AddPlanSecondStepPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPlanViewModel>.value(
      value: viewModel,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBarWidget(context),
          body: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '플랜 이름을\n정해주세요',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                PlanNameTextFieldWidget(),
                SizedBox(height: 10),
                DescriptionTextFieldWidget(),
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
                disabled:
                    !context.watch<AddPlanViewModel>().isSecondStepInvalid,
                onPressed: () => context.push('/addPlan/complete',
                    extra: context.read<AddPlanViewModel>()),
              ),
            ),
          ),
        );
      },
    );
  }
}
