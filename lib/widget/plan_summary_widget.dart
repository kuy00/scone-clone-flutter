import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/plan_list_view_model.dart';
import 'package:flutter_study/view_model/plan_view_model.dart';
import 'package:flutter_study/widget/consumption_by_plan_widget.dart';

class PlanSummaryWidget extends StatelessWidget {
  const PlanSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final planListViewModel = PlanListViewModel();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: FractionallySizedBox(
        heightFactor: 0.88,
        widthFactor: 1,
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '요약',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '대한민국 - 원',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoColors.lightBackgroundGray,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '총 소비',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          '0 원',
                          style: TextStyle(
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
                    height: 100,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoColors.lightBackgroundGray,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '총 수입',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          '0 원',
                          style: TextStyle(
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
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CupertinoColors.lightBackgroundGray,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '남은 총 예산',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '--',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '/',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '설정되지 않음',
                        style: TextStyle(
                          fontSize: 16,
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
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Column(
              children: List<Widget>.generate(planListViewModel.plans.length,
                  (index) {
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
      ),
    );
  }
}
