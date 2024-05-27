import 'package:drift/drift.dart';
import 'package:flutter_study/database/database.dart';
import 'package:flutter_study/database/entity/plan_entity.dart';
import 'package:flutter_study/database/table/plan_table.dart';

part 'plan_dao.g.dart';

@DriftAccessor(tables: [Plans])
class PlanDao extends DatabaseAccessor<Database> with _$PlanDaoMixin {
  PlanDao(super.db);

  Future<List<PlanEntity>> getAll() => db.select(plans).get();
  Future<void> create(PlanEntity plan) async {
    into(plans).insert(PlansCompanion(
      startDate: Value(plan.startDate),
      endDate: Value(plan.endDate),
      type: Value(plan.type),
      name: Value(plan.name),
      memo: Value(plan.memo),
      icon: Value(plan.icon),
      totalAmount: Value(plan.totalAmount),
      createdAt: Value(DateTime.now()),
    ));
  }
}
