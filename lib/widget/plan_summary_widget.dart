import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/plan_list_view_model.dart';
import 'package:flutter_study/view_model/plan_view_model.dart';
import 'package:flutter_study/widget/consumption_by_plan_widget.dart';

class PlanSummaryWidget extends StatelessWidget {
  final PlanListViewModel planListViewModel;

  const PlanSummaryWidget(this.planListViewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.88,
      widthFactor: 1,
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '요약',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '대한민국 - 원',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Scrollbar(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CupertinoColors.lightBackgroundGray,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '총 소비',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                '${planListViewModel.getTotalAmountByHistoryType('consumption').toString()} 원',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CupertinoColors.lightBackgroundGray,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '총 수입',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                '${planListViewModel.getTotalAmountByHistoryType('income').toString()} 원',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoColors.lightBackgroundGray,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              '남은 총 예산',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${planListViewModel.getRemainAmount.toString()}원',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              '/',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${planListViewModel.getBudget.toString()}원',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    children: [
                      Text(
                        '플랜별 소비',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List<Widget>.generate(
                        planListViewModel.plans.length, (index) {
                      final planViewModel =
                          PlanViewModel(planListViewModel.plans[index]);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: ConsumptionByPlanWidget(
                          planViewModel: planViewModel,
                        ),
                      );
                    }),
                  )
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
