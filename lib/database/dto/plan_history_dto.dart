import 'package:flutter_study/enum/plan_history_type.dart';

class PlanHistoryDto {
  final int? id;
  final String icon;
  final int planId;
  final PlanHistoryType type;
  final int amount;
  final String memo;
  final DateTime date;
  final DateTime? createdAt;

  PlanHistoryDto({
    this.id,
    required this.icon,
    required this.planId,
    required this.type,
    required this.amount,
    required this.memo,
    required this.date,
    this.createdAt,
  });
}
