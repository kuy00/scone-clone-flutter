import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/plan_view_model.dart';
import 'package:flutter_study/widget/app_bar_widget.dart';
import 'package:flutter_study/widget/plan_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarWidget(context),
      ),
      body: ChangeNotifierProvider<PlanViewModel>(
        create: (_) => PlanViewModel(),
        builder: (context, child) {
          return Column(
            children: [
              Consumer<PlanViewModel>(builder: (context, planViewModel, child) {
                return Expanded(
                  child: PageView.builder(
                      controller: planViewModel.pageController,
                      onPageChanged: planViewModel.changePage,
                      itemCount: planViewModel.plans.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PlanCardWidget(
                            planEntity: planViewModel.plans[index]);
                      }),
                );
              }),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      context.watch<PlanViewModel>().plans.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor:
                                  context.watch<PlanViewModel>().currentPage ==
                                          index
                                      ? const Color(0xFF181818)
                                      : Colors.grey,
                            ),
                          )),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
