import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/plan_view_model.dart';

class ConsumptionByPlanWidget extends StatelessWidget {
  final PlanViewModel planViewModel;
  const ConsumptionByPlanWidget({super.key, required this.planViewModel});

  @override
  Widget build(BuildContext context) {
    // TODO : 플랜의 타입에 맞춰서 수정 필요
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CupertinoColors.lightBackgroundGray,
              ),
              child: Text(
                planViewModel.icon,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  planViewModel.name,
                  style: const TextStyle(fontSize: 10),
                ),
                Text(
                  '${planViewModel.summaryAmountByHistoryType.toString()}원',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              '${planViewModel.remainAmount.toString()}원',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              '남음',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        )
      ],
    );
  }
}
