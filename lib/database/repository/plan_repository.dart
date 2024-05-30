import 'dart:async';

import 'package:flutter_study/database/dao/plan_dao.dart';
import 'package:flutter_study/database/dto/plan_dto.dart';
import 'package:flutter_study/entity/plan_entity.dart';

class PlanRepository {
  final PlanDao planDao;

  PlanRepository(this.planDao);

  Future<List<PlanEntity>> getPlans() async {
    List<PlanDto> plans = await planDao.getAll();
    return plans.map((plan) => _toModel(plan)).toList();
  }

  Future<void> createPlan(PlanEntity plan) async {
    await planDao.create(_toEntity(plan));
  }

  PlanEntity _toModel(PlanDto plan) {
    return PlanEntity(
        id: plan.id!,
        startDate: plan.startDate,
        endDate: plan.endDate,
        type: plan.type,
        name: plan.name,
        memo: plan.memo,
        icon: plan.icon,
        planHistory: [],
        totalAmount: plan.totalAmount);
  }

  PlanDto _toEntity(PlanEntity plan) {
    return PlanDto(
        startDate: plan.startDate,
        endDate: plan.endDate,
        type: plan.type,
        name: plan.name,
        memo: plan.memo,
        icon: plan.icon,
        totalAmount: plan.totalAmount);
  }
}
