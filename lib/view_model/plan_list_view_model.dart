import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';

class PlanListViewModel extends ChangeNotifier {
  final pageController = PageController(initialPage: 0);
  final List<PlanEntity> _plans = [
    PlanEntity(
        id: 0,
        type: PlanType.free,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        memo: "소비계획1메모",
        name: "소비계획1",
        icon: "😀",
        planHistory: [
          PlanHistoryEntity(
            id: 0,
            type: PlanHistoryType.consumption,
            memo: "메모1",
            createAt: DateTime.now(),
            amount: 100,
          ),
          PlanHistoryEntity(
            id: 1,
            type: PlanHistoryType.consumption,
            memo: "메모2",
            createAt: DateTime.now(),
            amount: 500,
          )
        ],
        totalAmount: 0),
    PlanEntity(
        id: 1,
        type: PlanType.plan,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        memo: "소비계획2메모",
        name: "소비계획2",
        icon: "😍",
        planHistory: [
          PlanHistoryEntity(
            id: 0,
            type: PlanHistoryType.consumption,
            memo: "메모1",
            createAt: DateTime.now(),
            amount: 100,
          ),
          PlanHistoryEntity(
            id: 1,
            type: PlanHistoryType.consumption,
            memo: "메모2",
            createAt: DateTime.now(),
            amount: 200,
          )
        ],
        totalAmount: 1000),
    PlanEntity(
      id: 2,
      type: PlanType.plan,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      memo: "소비계획3메모",
      name: "소비계획3",
      icon: "😁",
      planHistory: [
        PlanHistoryEntity(
          id: 0,
          type: PlanHistoryType.income,
          memo: '급여',
          createAt: DateTime.now(),
          amount: 100000,
        ),
      ],
      totalAmount: 1000,
    ),
    PlanEntity(
      id: 3,
      type: PlanType.plan,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      memo: "소비계획4메모",
      name: "소비계획4",
      icon: "😁",
      planHistory: [],
      totalAmount: 1000,
    ),
    PlanEntity(
      id: 4,
      type: PlanType.free,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      memo: "소비계획5메모",
      name: "소비계획5",
      icon: "😁",
      planHistory: [],
      totalAmount: 0,
    ),
  ];
  int _currentPage = 0;

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

  int get remainAmount =>
      _plans.fold(0, (sum, plan) => sum + plan.remainAmount);

  int get budget => _plans.fold(0, (sum, plan) => sum + plan.totalAmount);
}
