import 'dart:async';

import 'package:flutter_study/database/dao/plan_dao.dart';
import 'package:flutter_study/database/dto/plan_dto.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/extension/plan_dto_extension.dart';
import 'package:flutter_study/extension/plan_entity_extension.dart';

class PlanRepository {
  final PlanDao planDao;

  PlanRepository(this.planDao);

  Future<List<PlanEntity>> getPlans() async {
    List<PlanDto> plans = await planDao.getAll();
    return plans.map((plan) => plan.toEntity()).toList();
  }

  Future<void> createPlan(PlanEntity plan) async {
    await planDao.create(plan.toDto());
  }
}
