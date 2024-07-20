import 'package:flutter_study/database/dto/plan_history_dto.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';

extension PlanHistoryDtoExtension on PlanHistoryDto {
  PlanHistoryEntity toEntity() {
    return PlanHistoryEntity(
      id: id,
      planId: planId,
      type: type,
      amount: amount,
      memo: memo,
    );
  }
}
