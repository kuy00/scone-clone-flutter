import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';

class PlanCardWidget extends StatelessWidget {
  final PlanEntity planEntity;
  const PlanCardWidget({super.key, required this.planEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(planEntity.icon),
                Text(planEntity.name),
              ],
            ),
          ],
        ));
  }
}
