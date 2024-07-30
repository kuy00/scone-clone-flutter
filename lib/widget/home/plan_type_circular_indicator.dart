import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/view_model/circular_indicator_view_model.dart';
import 'package:flutter_study/widget/home/circular_inner_plan_type_info.dart';
import 'package:flutter_study/widget/home/circular_inner_remaining_time.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PlanTypeCircularIndicator extends StatelessWidget {
  final PlanEntity plan;

  const PlanTypeCircularIndicator({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CircularIndicatorViewModel(plan: plan),
      builder: (context, child) {
        return Consumer<CircularIndicatorViewModel>(
            builder: (_, circularIndicatorViewModel, __) =>
                CircularPercentIndicator(
                  radius: 100,
                  lineWidth: circularIndicatorViewModel.isPressed ? 4 : 1.5,
                  percent: circularIndicatorViewModel.timePercent,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFFF2F2F2),
                  backgroundColor: Colors.transparent,
                  widgetIndicator: Center(
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Listener(
                        onPointerDown: (e) =>
                            circularIndicatorViewModel.setIsPressed(true),
                        onPointerUp: (e) =>
                            circularIndicatorViewModel.setIsPressed(false),
                        child: Transform.rotate(
                          angle: radians(
                                  -360 * circularIndicatorViewModel.timePercent)
                              .toDouble(),
                          child: SvgPicture.asset(
                            'assets/icons/timer.svg',
                            colorFilter: const ColorFilter.mode(
                                Color(0xFFF2F2F2), BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                  animation: true,
                  center: CircularPercentIndicator(
                    radius: 90,
                    lineWidth: 12,
                    percent: circularIndicatorViewModel.amountPercent,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: const Color(0xFFF2F2F2),
                    progressColor: circularIndicatorViewModel.isPressed ||
                            circularIndicatorViewModel.timePercent == 0
                        ? const Color(0xFFD5D5D5)
                        : const Color(0xFF1773FC),
                    animation: true,
                    // TODO : animation 추가
                    center: circularIndicatorViewModel.isPressed
                        ? CircularInnerRemainingTime(
                            startDate: plan.startDate, endDate: plan.endDate)
                        : CircularInnerPlanTypeInfo(
                            remainAmount: plan.remainAmount,
                            totalAmount: plan.totalAmount),
                  ),
                ));
      },
    );
  }
}
