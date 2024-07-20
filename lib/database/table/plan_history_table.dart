import 'package:drift/drift.dart';
import 'package:flutter_study/database/dto/plan_history_dto.dart';
import 'package:flutter_study/database/table/plan_table.dart';
import 'package:flutter_study/enum/plan_history_type.dart';

@UseRowClass(PlanHistoryDto)
class PlanHistories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get icon => text().withDefault(const Constant(''))();
  IntColumn get planId => integer().references(Plans, #id)();
  TextColumn get type => textEnum<PlanHistoryType>()
      .withDefault(Constant(PlanHistoryType.consumption.toString()))();
  IntColumn get amount => integer()();
  TextColumn get memo => text().withDefault(const Constant(''))();
  DateTimeColumn get date => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(Constant(DateTime.now()))();
}
