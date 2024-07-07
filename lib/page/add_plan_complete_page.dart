import 'package:flutter/material.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:flutter_study/widget/add_plan/app_bar_widget.dart';
import 'package:flutter_study/widget/button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddPlanCompletePage extends StatelessWidget {
  final AddPlanViewModel viewModel;

  const AddPlanCompletePage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPlanViewModel>.value(
      value: viewModel,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBarWidget(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF3FF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      context.read<AddPlanViewModel>().emoji,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    context
                        .read<AddPlanViewModel>()
                        .planNameTextController
                        .text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    context
                        .read<AddPlanViewModel>()
                        .descriptionTextController
                        .text,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFC4C4C4),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${context.read<AddPlanViewModel>().priceTextController.text}원',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1773FC),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${dateFormat(context.read<AddPlanViewModel>().selectedDate!.first, 'MMM dd일')} ~ ${dateFormat(context.read<AddPlanViewModel>().selectedDate!.last, 'MMM dd일')}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF8D8D8D)),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              child: ButtonWidget(
                text: '플랜 시작',
                onPressed: () {
                  context.read<AddPlanViewModel>().addPlan();
                  context.go('/');
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
