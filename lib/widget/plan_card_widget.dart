import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/plan_view_model.dart';

class PlanCardWidget extends StatelessWidget {
  final PlanViewModel planViewModel;
  const PlanCardWidget({super.key, required this.planViewModel});

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
                Text(planViewModel.icon),
                Text(planViewModel.name),
              ],
            ),
          ],
        ));
  }
}
