import 'package:flutter/material.dart';
import 'package:flutter_study/database/database.dart';
import 'package:flutter_study/database/repository/plan_repository.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';
import 'package:flutter_study/enum/plan_type.dart';

class PlanListViewModel extends ChangeNotifier {
  // TODO : 의존성 주입
  final PlanRepository planRepository = PlanRepository(Database().planDao);
  final pageController = PageController(initialPage: 0);
  List<PlanEntity> _plans = [];
  int _currentPage = 0;

  void getPlan() async {
    _plans = await planRepository.getPlans();
    notifyListeners();
  }

  void addPlan() async {
    // TODO : 추후에 등록 UI 추가 시 수정
    await PlanRepository(Database().planDao).createPlan(PlanEntity(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        type: PlanType.plan,
        name: '계획1',
        memo: 'memo',
        icon: '😀',
        planHistory: [],
        totalAmount: 1000));
    getPlan();
  }

  // getter
  List<PlanEntity> get plans => _plans;
  int get currentPage => _currentPage;

  void changePage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  int get totalConsumption =>
      _plans.fold(0, (sum, plan) => sum + plan.totalConsumption);

  int get totalIncome => _plans.fold(0, (sum, plan) => sum + plan.totalIncome);

  int get remainAmount => _plans.fold(
      0,
      (sum, plan) =>
          sum + (plan.type == PlanType.plan ? plan.remainAmount : 0));

  int get budget => _plans.fold(0, (sum, plan) => sum + plan.totalAmount);

  void addPlanHistory(int planId, PlanHistoryEntity planHistory) {
    _plans.map((plan) {
      if (plan.id == planId) {
        plan.planHistory.add(planHistory);
      }
    }).toList();
    notifyListeners();
  }
}
