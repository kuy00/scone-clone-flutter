import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';
import 'package:flutter_study/enum/plan_type.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:flutter_study/view_model/plan_list_view_model.dart';
import 'package:flutter_study/widget/home/free_type_circular_indicator.dart';
import 'package:flutter_study/widget/home/plan_type_circular_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

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
                Column(
                  children: [
                    Text(
                      plan.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (plan.memo != '')
                      Text(
                        plan.memo,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                )
              ],
            ),
            plan.type == PlanType.free
                ? FreeTypeCircularIndicator(plan: plan)
                : PlanTypeCircularIndicator(plan: plan),
            dateDiff(DateTime.now(), dateAdd(plan.endDate, days: 1),
                        unit: Unit.second) <=
                    0
                ? ElevatedButton(
                    onPressed: () => print('complete  plan'),
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.green),
                      minimumSize:
                          const MaterialStatePropertyAll(Size.fromHeight(50)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(14)),
                      ),
                    ),
                    child: const Text(
                      '플랜 완료',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => context
                        .push('/plan/${plan.id}/addHistory')
                        .then((value) {
                      if (value is PlanHistoryEntity) {
                        context
                            .read<PlanListViewModel>()
                            .addPlanHistory(plan.id!, value);
                      }
                    }),
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFF1773FC)),
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
        ),
      ),
    );
  }
}
