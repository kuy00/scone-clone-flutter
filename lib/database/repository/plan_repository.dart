import 'dart:async';

import 'package:flutter_study/database/dao/plan_dao.dart';
import 'package:flutter_study/database/dao/plan_history_dao.dart';
import 'package:flutter_study/database/database.dart';
import 'package:flutter_study/database/dto/plan_dto.dart';
import 'package:flutter_study/database/dto/plan_history_dto.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/extension/plan_dto_extension.dart';
import 'package:flutter_study/extension/plan_entity_extension.dart';
import 'package:flutter_study/extension/plan_history_dto_extension.dart';

class PlanRepository {
  final PlanDao planDao = Database().planDao;
  final PlanHistoryDao planHistoryDao = Database().planHistoryDao;

  Future<List<PlanEntity>> getPlans() async {
    List<PlanDto> plans = await planDao.getAll();
    return Future.wait(plans.map((PlanDto plan) async {
      PlanEntity planEntity = plan.toEntity();
      List<PlanHistoryDto> planHistories =
          await planHistoryDao.getByPlanId(planEntity.id!);

      planEntity.planHistory =
          planHistories.map((planHistory) => planHistory.toEntity()).toList();

      return planEntity;
    }).toList());
  }

  Future<PlanEntity> getPlan(int id) async {
    PlanDto plan = await planDao.getById(id);
    return plan.toEntity();
  }

  Future<void> createPlan(PlanEntity plan) async {
    await planDao.create(plan.toDto());
  }
}
