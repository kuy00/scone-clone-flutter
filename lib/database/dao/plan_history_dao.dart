import 'package:drift/drift.dart';
import 'package:flutter_study/database/database.dart';
import 'package:flutter_study/database/dto/plan_history_dto.dart';
import 'package:flutter_study/database/table/plan_history_table.dart';

part 'plan_history_dao.g.dart';

@DriftAccessor(tables: [PlanHistories])
class PlanHistoryDao extends DatabaseAccessor<Database>
    with _$PlanHistoryDaoMixin {
  PlanHistoryDao(super.db);

  Future<List<PlanHistoryDto>> getByPlanId(int planId) => (db
          .select(planHistories)
        ..where((t) => t.planId.equals(planId))
        ..orderBy(
            [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
      .get();

  Future<void> create(PlanHistoryDto planHistory) =>
      into(planHistories).insert(PlanHistoriesCompanion(
        planId: Value(planHistory.planId),
        icon: Value(planHistory.icon ?? ''),
        type: Value(planHistory.type),
        amount: Value(planHistory.amount),
        memo: Value(planHistory.memo),
        date: Value(planHistory.date),
      ));
}
