import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';

class PlanListViewModel extends ChangeNotifier {
  final pageController = PageController(initialPage: 0);
  final List<PlanEntity> _plans = [
    PlanEntity(
        id: 0,
        type: "FREE",
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        memo: "소비계획1메모",
        name: "소비계획1",
        icon: "😀",
        planHistory: [
          PlanHistoryEntity(
            id: 0,
            type: 'EXPENSES',
            memo: "메모1",
            createAt: DateTime.now(),
            amount: 100,
          ),
          PlanHistoryEntity(
            id: 1,
            type: 'EXPENSES',
            memo: "메모2",
            createAt: DateTime.now(),
            amount: 200,
          )
        ],
        totalAmount: 1000),
    PlanEntity(
        id: 1,
        type: 'FREE',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        memo: "소비계획2메모",
        name: "소비계획2",
        icon: "😍",
        planHistory: [
          PlanHistoryEntity(
            id: 0,
            type: 'EXPENSES',
            memo: "메모1",
            createAt: DateTime.now(),
            amount: 100,
          ),
          PlanHistoryEntity(
            id: 1,
            type: 'EXPENSES',
            memo: "메모2",
            createAt: DateTime.now(),
            amount: 200,
          )
        ],
        totalAmount: 1000),
  ];
  int _currentPage = 0;

  // getter
  List<PlanEntity> get plans => _plans;
  int get currentPage => _currentPage;

  void changePage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
