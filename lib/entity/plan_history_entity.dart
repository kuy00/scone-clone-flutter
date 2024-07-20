import 'package:flutter_study/enum/plan_history_type.dart';

class PlanHistoryEntity {
  int? id; // 아이디
  int planId;
  PlanHistoryType type;
  int amount; // 금액
  String memo; // 메모

  PlanHistoryEntity({
    this.id,
    required this.planId,
    required this.type,
    required this.amount,
    required this.memo,
  });
}
