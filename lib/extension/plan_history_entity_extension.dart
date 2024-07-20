import 'package:flutter_study/database/dto/plan_history_dto.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';

extension PlanHistoryEntityExtension on PlanHistoryEntity {
  PlanHistoryDto toDto() {
    return PlanHistoryDto(
      planId: planId,
      icon: icon,
      type: type,
      amount: amount,
      memo: memo,
      date: date,
    );
  }
}
