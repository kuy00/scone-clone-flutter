import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:jiffy/jiffy.dart';

class CircularIndicatorViewModel extends ChangeNotifier {
  final PlanEntity plan;
  bool _isPressed = false;
  bool get isPressed => _isPressed;

  CircularIndicatorViewModel({required this.plan});

  double get timePercent {
    var percent = dateDiff(DateTime.now(), dateAdd(plan.endDate, days: 1),
                unit: Unit.second)
            .toDouble() /
        dateDiff(plan.startDate, dateAdd(plan.endDate, days: 1),
                unit: Unit.second)
            .toDouble();

    if (percent.isNaN || percent.isInfinite || percent < 0) {
      return 0;
    } else if (percent > 1) {
      return 1;
    } else {
      return percent;
    }
  }

  double get amountPercent {
    var percent = plan.remainAmount.toDouble() / plan.totalAmount.toDouble();

    if (percent.isNaN || percent.isInfinite || percent < 0) {
      return 0;
    } else if (percent > 1) {
      return 1;
    } else {
      return percent;
    }
  }

  void setIsPressed(flag) {
    _isPressed = flag;
    notifyListeners();
  }
}
