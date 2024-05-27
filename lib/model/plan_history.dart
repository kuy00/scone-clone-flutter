import 'package:flutter_study/enums/plan_history_type.dart';

class PlanHistory {
  int id; // 아이디
  PlanHistoryType type;
  int amount; // 금액
  String memo; // 메모
  DateTime createAt; // 생성 일자

  PlanHistory(
      {required this.id,
      required this.type,
      required this.amount,
      required this.memo,
      required this.createAt});
}