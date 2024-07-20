import 'package:flutter_study/enum/plan_history_type.dart';

class PlanHistoryDto {
  final int? id;
  final int planId;
  final PlanHistoryType type;
  final int amount;
  final String memo;
  final DateTime? createdAt;

  PlanHistoryDto({
    this.id,
    required this.planId,
    required this.type,
    required this.amount,
    required this.memo,
    this.createdAt,
  });
}
