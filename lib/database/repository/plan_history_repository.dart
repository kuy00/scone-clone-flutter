import 'package:flutter_study/database/database.dart';
import 'package:flutter_study/database/dto/plan_history_dto.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';
import 'package:flutter_study/extension/plan_history_dto_extension.dart';
import 'package:flutter_study/extension/plan_history_entity_extension.dart';

class PlanHistoryRepository {
  final planHistoryDao = Database().planHistoryDao;

  Future<List<PlanHistoryEntity>> getPlanHistoryByPlanId(int planId) async {
    List<PlanHistoryDto> planHistories =
        await planHistoryDao.getByPlanId(planId);

    return planHistories.map((planHistory) => planHistory.toEntity()).toList();
  }

  Future<void> createPlanHistory(PlanHistoryEntity planHistory) =>
      planHistoryDao.create(planHistory.toDto());
}
