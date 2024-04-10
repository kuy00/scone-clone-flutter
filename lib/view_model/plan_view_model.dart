import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';

class PlanViewModel {
  final PlanEntity _plan;

  PlanViewModel(this._plan);

  int get id => _plan.id;
  DateTime get startDate => _plan.startDate;
  DateTime get endDate => _plan.endDate;
  String get type => _plan.type;
  String get name => _plan.name;
  String get memo => _plan.memo;
  String get icon => _plan.icon;
  List<PlanHistoryEntity> get planHistory => _plan.planHistory;
  int get totalAmount => _plan.totalAmount;

  int get summaryAmountByHistoryType =>
      _plan.summaryAmountByHistoryType('consumption');

  int get remainAmount => _plan.remainAmount;
}
