import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';
import 'package:flutter_study/enum/plan_history_type.dart';
import 'package:flutter_study/util/number_util.dart';

class PlanHistoryBadge extends StatelessWidget {
  final PlanHistoryEntity planHistory;

  const PlanHistoryBadge({super.key, required this.planHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEAEAEA), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: planHistory.icon != '',
            child: Row(
              children: [
                Text(planHistory.icon!),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
          Visibility(
            visible: planHistory.memo != '',
            child: Row(
              children: [
                Text(
                  planHistory.memo,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  width: 2,
                )
              ],
            ),
          ),
          Text(
            '${currencyFormat(planHistory.amount)}원',
            style: planHistory.type == PlanHistoryType.income
                ? const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  )
                : const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
