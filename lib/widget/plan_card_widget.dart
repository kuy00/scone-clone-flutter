import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/widget/timer_circular_indicator.dart';

class PlanCardWidget extends StatelessWidget {
  final PlanEntity plan;
  const PlanCardWidget({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(plan.icon),
                Text(plan.name),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            TimerCircularIndicator(
              percent: plan.totalConsumption.toDouble() /
                  plan.totalAmount.toDouble(),
              center: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('남은 예산'), Text('1,000 원')],
              ),
            )
          ],
        ));
  }
}
