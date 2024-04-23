import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/widget/free_type_circular_indicator.dart';
import 'package:flutter_study/widget/plan_type_circular_indicator.dart';
import 'package:go_router/go_router.dart';

class PlanCardWidget extends StatelessWidget {
  final PlanEntity plan;
  const PlanCardWidget({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('상세 내역'),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    plan.icon,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    plan.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              plan.type == PlanType.free
                  ? FreeTypeCircularIndicator(plan: plan)
                  : PlanTypeCircularIndicator(plan: plan),
              ElevatedButton(
                onPressed: () => context.push('/addPlan'),
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.blueAccent),
                  minimumSize:
                      const MaterialStatePropertyAll(Size.fromHeight(50)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(14)),
                  ),
                ),
                child: const Text(
                  '내역 추가',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )),
    );
  }
}