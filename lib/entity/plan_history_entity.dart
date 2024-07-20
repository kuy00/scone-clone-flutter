import 'package:flutter_study/enum/plan_history_type.dart';

class PlanHistoryEntity {
  int? id; // 아이디
  String icon;
  int planId;
  PlanHistoryType type;
  int amount; // 금액
  String memo; // 메모
  DateTime date;

  PlanHistoryEntity({
    this.id,
    required this.icon,
    required this.planId,
    required this.type,
    required this.amount,
    required this.memo,
    required this.date,
  });
}
