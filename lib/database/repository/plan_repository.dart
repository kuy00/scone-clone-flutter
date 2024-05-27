import 'dart:async';

import 'package:flutter_study/database/dao/plan_dao.dart';
import 'package:flutter_study/database/entity/plan_entity.dart';
import 'package:flutter_study/model/plan.dart';

class PlanRepository {
  final PlanDao planDao;

  PlanRepository(this.planDao);

  Future<List<Plan>> getPlans() async {
    List<PlanEntity> plans = await planDao.getAll();
    return plans.map((plan) => _toModel(plan)).toList();
  }

  Future<void> createPlan(Plan plan) async {
    await planDao.create(_toEntity(plan));
  }

  Plan _toModel(PlanEntity plan) {
    return Plan(
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

  PlanEntity _toEntity(Plan plan) {
    return PlanEntity(
        startDate: plan.startDate,
        endDate: plan.endDate,
        type: plan.type,
        name: plan.name,
        memo: plan.memo,
        icon: plan.icon,
        totalAmount: plan.totalAmount);
  }
}
