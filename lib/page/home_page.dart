import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/plan_list_view_model.dart';
import 'package:flutter_study/widget/home/app_bar_widget.dart';
import 'package:flutter_study/widget/home/plan_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlanListViewModel>(
      create: (_) {
        PlanListViewModel planListViewModel = PlanListViewModel();
        planListViewModel.getPlan();
        return planListViewModel;
      },
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF3F3F3),
          appBar: AppBarWidget(context),
          body: Consumer<PlanListViewModel>(
            builder: (context, planListViewModel, child) {
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: planListViewModel.pageController,
                      onPageChanged: planListViewModel.changePage,
                      itemCount: planListViewModel.plans.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PlanCardWidget(
                          plan: planListViewModel.plans[index],
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        planListViewModel.dotsCount,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: planListViewModel.currentPage ==
                                      planListViewModel.getDotsIndex(index)
                                  ? const Color(0xFF181818)
                                  : Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
