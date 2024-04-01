import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';

class ConsumptionByPlanWidget extends StatelessWidget {
  final PlanEntity planEntity;
  const ConsumptionByPlanWidget({super.key, required this.planEntity});

  @override
  Widget build(BuildContext context) {
    final int totalConsumption =
        planEntity.planHistory.fold(0, (sum, element) => sum + element.amount);
    final int remainAmount = planEntity.totalAmount - totalConsumption;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 45,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CupertinoColors.lightBackgroundGray,
              ),
              child: Text(
                planEntity.icon,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  planEntity.name,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  '${totalConsumption.toString()}원',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              '${remainAmount.toString()}원',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              '남음',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          ],
        )
      ],
    );
  }
}
