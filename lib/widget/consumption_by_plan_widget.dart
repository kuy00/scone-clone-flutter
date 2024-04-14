import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';

class ConsumptionByPlanWidget extends StatelessWidget {
  final PlanEntity plan;
  const ConsumptionByPlanWidget({super.key, required this.plan});

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
                plan.icon,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  plan.name,
                  style: const TextStyle(fontSize: 10),
                ),
                Text(
                  '${plan.summaryAmountByHistoryType.toString()}원',
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
              '${plan.remainAmount.toString()}원',
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
