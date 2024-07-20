import 'package:flutter_study/database/repository/plan_history_repository.dart';
import 'package:flutter_study/database/repository/plan_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<PlanRepository>(() => PlanRepository());
  locator.registerFactory<PlanHistoryRepository>(() => PlanHistoryRepository());
}
