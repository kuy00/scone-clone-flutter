import 'package:flutter/material.dart';
import 'package:flutter_study/database/repository/plan_repository.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';
import 'package:flutter_study/enum/plan_type.dart';
import 'package:get_it/get_it.dart';

class PlanListViewModel extends ChangeNotifier {
  final PlanRepository planRepository = GetIt.I<PlanRepository>();
  final pageController = PageController(initialPage: 0);
  List<PlanEntity> _plans = [];
  int _currentPage = 0;
  final int _maxVisibleDots = 5;

  void getPlan() async {
    _plans = await planRepository.getPlans();
    notifyListeners();
  }

  // getter
  List<PlanEntity> get plans => _plans;
  int get currentPage => _currentPage;
  int get maxVisibleDots => _maxVisibleDots;

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

  int get dotsCount {
    int totalPageGroup = (plans.length / maxVisibleDots).ceil();
    int currentPageGroup = ((currentPage + 1) / maxVisibleDots).ceil();

    bool isLastPageGroup = currentPageGroup == totalPageGroup;

    if (isLastPageGroup) {
      return plans.length % maxVisibleDots == 0
          ? maxVisibleDots
          : plans.length % maxVisibleDots;
    } else {
      return maxVisibleDots;
    }
  }

  int getDotsIndex(int index) {
    return index +
        (currentPage >= maxVisibleDots
            ? maxVisibleDots * (currentPage / maxVisibleDots).floor()
            : 0);
  }

  void addPlanHistory(int planId, PlanHistoryEntity planHistory) {
    _plans.map((plan) {
      if (plan.id == planId) {
        plan.planHistory.add(planHistory);
      }
    }).toList();
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
}
