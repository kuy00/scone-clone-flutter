import 'package:flutter_study/database/dto/plan_dto.dart';
import 'package:flutter_study/entity/plan_entity.dart';

extension PlanDtoExtension on PlanDto {
  PlanEntity toEntity() {
    return PlanEntity(
      startDate: startDate,
      endDate: endDate,
      type: type,
      name: name,
      memo: memo,
      icon: icon,
      planHistory: [],
      totalAmount: totalAmount,
    );
  }
}
