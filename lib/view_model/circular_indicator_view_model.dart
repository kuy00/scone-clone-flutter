import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:jiffy/jiffy.dart';

class CircularIndicatorViewModel extends ChangeNotifier {
  final PlanEntity plan;
  bool _isPressed = false;
  bool get isPressed => _isPressed;

  CircularIndicatorViewModel({required this.plan});

  double get percent {
    var percent =
        dateDiff(DateTime.now(), plan.endDate, unit: Unit.day).toDouble() /
            dateDiff(plan.startDate, plan.endDate, unit: Unit.day).toDouble();

    return percent < 0 || percent.isNaN || percent.isInfinite
        ? 0
        : percent > 1
            ? 1
            : percent;
  }

  void setIsPressed(flag) {
    _isPressed = flag;
    notifyListeners();
  }
}
