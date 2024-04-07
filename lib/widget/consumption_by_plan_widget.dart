import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/view_model/plan_view_model.dart';

class ConsumptionByPlanWidget extends StatelessWidget {
  final PlanViewModel planViewModel;
  const ConsumptionByPlanWidget({super.key, required this.planViewModel});

  @override
  Widget build(BuildContext context) {
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
                planViewModel.icon,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  planViewModel.name,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  '${planViewModel.getTotalConsumption().toString()}원',
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
              '${planViewModel.remainAmount.toString()}원',
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
